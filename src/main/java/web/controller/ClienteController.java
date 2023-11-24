package web.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.ClienteDao;
import web.model.Cliente;

@Controller
@Transactional
@RequestMapping("cliente")
public class ClienteController {
	
	@Autowired
	private ClienteDao dao;
	
	
	
	@RequestMapping("novo")
	public String novo() {
		return "cliente/novo";
	}
	
	@RequestMapping(value="adiciona",method = RequestMethod.POST)
	public String adiciona(@Valid Cliente cliente,BindingResult result, Model model) {
		if(result.hasErrors() || dao.buscaPorEmail(cliente.getEmail()) != null) {
			return "redirect:novo";
		}
		dao.adiciona(cliente);
		
		return "redirect:formLogin";
	}
	
	
	
	@RequestMapping("formLogin")
	public String formularioLogin() {
		return "cliente/login";
	}
	
	@RequestMapping("login")
	public String login(String email, String senha,Model model) {
		Cliente cliente = dao.buscaPorEmail(email);
		if(cliente != null && cliente.getSenha().equals(senha)) {
			return "cliente/agendamento";
		}
		
		if(email != null) {
			model.addAttribute("usuarioInvalido",email);
			return "cliente/login";
		}
		return "index";
		
	}
	
	

}
