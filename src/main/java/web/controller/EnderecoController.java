package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dao.EnderecoDao;

@Controller
@RequestMapping("/endereco")
public class EnderecoController {
	
	@Autowired
	private EnderecoDao dao;
	
	@RequestMapping("/novo")
	public String novo() {
		return "endereco/novo";
	}

}
