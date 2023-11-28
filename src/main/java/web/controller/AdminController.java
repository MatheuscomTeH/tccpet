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
import web.dao.ServicoDao;
import web.dao.UsuarioDao;
import web.model.Cliente;
import web.model.Funcionario;
import web.model.Role;
import web.model.Servico;
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
	private ServicoDao servicoDao;

	@Autowired
	private PasswordEncoder encoder;
	
	

	@Autowired
	private FuncionarioDao funcionarioDao;

	@RequestMapping("index")
	public String home() {
		return "admin/index";

	}

	//cliente
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
			clienteDao.remove(id);
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
	
	//funcionario

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
	
	//servico
	
	@RequestMapping("/novo-servico")
	public String novoServico() {
		return "admin/servico/novo";
	}

	@RequestMapping("/adiciona-servico")
	public String adicionaServico(@Valid Servico servico, BindingResult servicoResult) {
		System.out.println(servicoResult);
		if (servicoResult.hasErrors() || servicoDao.buscaPorNome(servico.getNome()) != null) {
			return "redirect:novo-servico";
		}

		servicoDao.adiciona(servico);

		return "redirect:lista-servico";
	}

	@RequestMapping("lista-servico")
	public String listaServico(Model model) {
		model.addAttribute("servicos", servicoDao.listar());
		return "admin/servico/lista";
	}

	@RequestMapping("/remove-servico")
	public String removeServico(long id) {
		Servico servico = servicoDao.buscaPorId(id);
		if (servico != null) {
			servicoDao.remove(id);

		}
		return "redirect:lista-servico";
	}

	@RequestMapping("/exibe-servico")
	public String exibeServico(long id, Model model) {
		model.addAttribute("servico", servicoDao.buscaPorId(id));
		return "admin/servico/exibe";
	}

	@RequestMapping("/edita-servico")
	public String editaServico(long id, Model model) {
		model.addAttribute("servico", servicoDao.buscaPorId(id));
		return "admin/servico/edita";
	}

	@RequestMapping("/altera-servico")
	public String alteraServico(@Valid Servico servico, BindingResult servicoResult) {

		if(servicoResult.hasErrors() || servicoDao.buscaPorNome(servico.getNome()) != null && servicoDao.buscaPorNome(servico.getNome()).getId() != servico.getId() ) {
			return "redirect:edita-servico?id=" + servico.getId();
		}
		
		servicoDao.alterar(servico);

		return "redirect:lista-servico";

	}

}
