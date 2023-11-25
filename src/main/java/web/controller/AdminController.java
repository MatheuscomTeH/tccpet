package web.controller;


import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.ClienteDao;
import web.dao.UsuarioDao;
import web.model.Cliente;
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
		model.addAttribute("clientes",clienteDao.listar());
		return "admin/cliente/lista";
	}
	
	@RequestMapping("/remove-cliente")
	public String removeCliente(long id) {
		Cliente cliente = clienteDao.buscaPorId(id);
		if(cliente != null ){
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
	public String editaCliente(long id,Model model) {
		model.addAttribute("cliente", clienteDao.buscaPorId(id));
		return "admin/cliente/edita";
	}
	
	@RequestMapping("/altera-cliente")
	public String altera(@Valid Usuario usuario, BindingResult userResult, @Valid Cliente cliente,
			BindingResult clientResult) {
	
		

		if(userResult.hasErrors() || clientResult.hasErrors() || (usuarioDao.findByEmail(usuario.getEmail()) != null && usuarioDao.findByEmail(usuario.getEmail()).getId() != clienteDao.buscaPorId(cliente.getId()).getUsuario().getId()) ) {
		 return	"redirect:edita-cliente?id="+cliente.getId();
		}
		Usuario newUser = clienteDao.buscaPorId(cliente.getId()).getUsuario();
		newUser.setEmail(usuario.getEmail());
		usuarioDao.alterar(newUser);
		cliente.setUsuario(newUser);
		clienteDao.alterar(cliente);
		
		return "redirect:lista-cliente";
		
	}
	

}
