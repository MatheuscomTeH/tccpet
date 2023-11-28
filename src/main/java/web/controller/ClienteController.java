package web.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dao.AnimalDao;
import web.dao.ClienteDao;
import web.dao.ServicoDao;
import web.dao.UsuarioDao;
import web.model.Animal;
import web.model.Cliente;
import web.model.Role;
import web.model.Usuario;

@Controller
@RequestMapping("cliente")
@Transactional
public class ClienteController {

	@Autowired
	private AnimalDao animalDao;

	@Autowired
	private UsuarioDao usuarioDao;

	@Autowired
	private ClienteDao dao;

	@Autowired
	private ServicoDao servicoDao;

	@Autowired
	private PasswordEncoder encoder;

	@RequestMapping("index")
	public String home(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		String email = authentication.getName();

		model.addAttribute("servicos", servicoDao.listar());
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());

		return "cliente/agendamento";

	}

	@RequestMapping("novo")
	public String returnForm() {
		return "cliente/novo";
	}

	@RequestMapping("adiciona")
	public String adiciona(@Valid Usuario usuario, BindingResult userResult, @Valid Cliente cliente,
			BindingResult clientResult) {

		if (userResult.hasErrors() || clientResult.hasErrors() || usuarioDao.findByEmail(usuario.getEmail()) != null) {
			return "redirect:novo";
		}

		usuario.setRole(Role.CLIENTE.getNome());
		usuario.setPassword(encoder.encode(usuario.getPassword()));
		usuarioDao.adiciona(usuario);
		cliente.setUsuario(usuario);
		dao.adiciona(cliente);

		return "/login";
	}

	// animal

	@RequestMapping("lista-animal")
	public String listaAnimal(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();

		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
		return "cliente/animal/lista";
	}

	@RequestMapping("novo-animal")
	public String novoAnimal(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
		return "cliente/animal/novo";

	}

	@RequestMapping("adiciona-animal")
	public String adicionaAnimal(@Valid Animal animal, BindingResult result) {

		if (result.hasErrors()) {
			return "redirect:novo-animal";
		}
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		animal.setCliente(usuarioDao.findByEmail(email).getCliente());
		animalDao.adiciona(animal);
		return "redirect:lista-animal";

	}

}
