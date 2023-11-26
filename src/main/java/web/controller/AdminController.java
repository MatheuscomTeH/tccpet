package web.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dao.ClienteDao;
import web.dao.FuncionarioDao;
import web.dao.UsuarioDao;
import web.model.Cliente;
import web.model.Funcionario;
import web.model.Role;
import web.model.Usuario;

@Transactional
@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private UsuarioDao usuarioDao;

	@Autowired
	private ClienteDao clienteDao;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private FuncionarioDao funcionarioDao;

	@RequestMapping("index")
	public String home() {
		return "admin/index";

	}

	@RequestMapping("/novo-cliente")
	public String novoCliente() {
		return "admin/cliente/novo";
	}

	@RequestMapping("/adiciona-cliente")
	public String adiciona(@Valid Usuario usuario, BindingResult userResult, @Valid Cliente cliente,
			BindingResult clientResult) {

		if (userResult.hasErrors() || clientResult.hasErrors() || usuarioDao.findByEmail(usuario.getEmail()) != null) {
			return "redirect:novo-cliente";
		}

		usuario.setRole(Role.CLIENTE.getNome());
		usuario.setPassword(encoder.encode(usuario.getPassword()));
		usuarioDao.adiciona(usuario);
		cliente.setUsuario(usuario);
		clienteDao.adiciona(cliente);

		return "redirect:lista-cliente";
	}

	@RequestMapping("lista-cliente")
	public String listaCliente(Model model) {
		model.addAttribute("clientes", clienteDao.listar());
		return "admin/cliente/lista";
	}

	@RequestMapping("/remove-cliente")
	public String removeCliente(long id) {
		Cliente cliente = clienteDao.buscaPorId(id);
		if (cliente != null) {
			clienteDao.remove(cliente.getId());
			usuarioDao.remove(cliente.getUsuario().getId());

		}
		return "redirect:lista-cliente";
	}

	@RequestMapping("/exibe-cliente")
	public String exibe(long id, Model model) {
		model.addAttribute("cliente", clienteDao.buscaPorId(id));
		return "admin/cliente/exibe";
	}

	@RequestMapping("/edita-cliente")
	public String editaCliente(long id, Model model) {
		model.addAttribute("cliente", clienteDao.buscaPorId(id));
		return "admin/cliente/edita";
	}

	@RequestMapping("/altera-cliente")
	public String altera(@Valid Usuario usuario, BindingResult userResult, @Valid Cliente cliente,
			BindingResult clientResult) {

		if (userResult.hasErrors() || clientResult.hasErrors()
				|| (usuarioDao.findByEmail(usuario.getEmail()) != null && usuarioDao.findByEmail(usuario.getEmail())
						.getId() != clienteDao.buscaPorId(cliente.getId()).getUsuario().getId())) {
			return "redirect:edita-cliente?id=" + cliente.getId();
		}
		Usuario newUser = clienteDao.buscaPorId(cliente.getId()).getUsuario();
		newUser.setEmail(usuario.getEmail());
		usuarioDao.alterar(newUser);
		cliente.setUsuario(newUser);
		clienteDao.alterar(cliente);

		return "redirect:lista-cliente";

	}

	@RequestMapping("/novo-funcionario")
	public String novoFuncionario() {
		return "admin/funcionario/novo";
	}

	@RequestMapping("/adiciona-funcionario")
	public String adicionaFuncionario(@Valid Usuario usuario, BindingResult userResult, @Valid Funcionario funcionario,
			BindingResult funcionarioResult) {
		if (userResult.hasErrors() || funcionarioResult.hasErrors()
				|| usuarioDao.findByEmail(usuario.getEmail()) != null
				|| funcionarioDao.buscaPorCPF(funcionario.getCpf()) != null) {
			return "redirect:novo-funcionario";
		}

		usuario.setRole(Role.FUNCIONARIO.getNome());
		usuario.setPassword(encoder.encode(usuario.getPassword()));
		usuarioDao.adiciona(usuario);
		funcionario.setUsuario(usuario);
		funcionarioDao.adiciona(funcionario);

		return "redirect:lista-funcionario";
	}

	@RequestMapping("lista-funcionario")
	public String listaFuncionario(Model model) {
		model.addAttribute("funcionarios", funcionarioDao.listar());
		return "admin/funcionario/lista";
	}

	@RequestMapping("/exibe-funcionario")
	public String exibeFuncionario(long id, Model model) {
		model.addAttribute("funcionario", funcionarioDao.consultar(id));
		return "admin/funcionario/exibe";
	}

	@RequestMapping("/remove-funcionario")
	public String removeFuncionario(long id) {
		Funcionario funcionario = funcionarioDao.consultar(id);
		if (funcionario != null) {
			funcionarioDao.remove(funcionario.getId());
			usuarioDao.remove(funcionario.getUsuario().getId());

		}
		return "redirect:lista-funcionario";
	}

	@RequestMapping("/edita-funcionario")
	public String editaFuncionario(long id, Model model) {
		model.addAttribute("funcionario", funcionarioDao.consultar(id));
		return "admin/funcionario/edita";
	}

	@RequestMapping("/altera-funcionario")
	public String alteraFuncionario(@Valid Usuario usuario, BindingResult userResult,
	                                @Valid Funcionario funcionario, BindingResult funcionarioResult) {

	    if (temErros(userResult, funcionarioResult, usuario, funcionario)) {
	        return "redirect:edita-funcionario?id=" + funcionario.getId();
	    }

	    Usuario newUser = funcionarioDao.consultar(funcionario.getId()).getUsuario();
	    newUser.setEmail(usuario.getEmail());
	    usuarioDao.alterar(newUser);

	    funcionario.setUsuario(newUser);
	    funcionarioDao.alterar(funcionario);

	    return "redirect:lista-funcionario";
	}

	private boolean temErros(BindingResult userResult, BindingResult funcionarioResult,
	                          Usuario usuario, Funcionario funcionario) {

	    if (temErros(userResult, funcionarioResult)) {
	        return true;
	    }

	    Usuario existingUser = usuarioDao.findByEmail(usuario.getEmail());
	    Funcionario existingFuncionario = funcionarioDao.consultar(funcionario.getId());

	    if ((existingUser != null && !(existingUser.getId()==existingFuncionario.getUsuario().getId()) ||
	        (funcionarioDao.buscaPorCPF(funcionario.getCpf()) != null &&
	         !(funcionarioDao.buscaPorCPF(funcionario.getCpf()).getId()==existingFuncionario.getId())))) {
	        return true;
	    }

	    return false;
	}

	private boolean temErros(BindingResult... results) {
	    for (BindingResult result : results) {
	        if (result.hasErrors()) {
	            return true;
	        }
	    }
	    return false;
	}

}
