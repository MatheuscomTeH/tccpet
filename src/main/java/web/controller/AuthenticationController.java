package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AuthenticationController {
	
	@RequestMapping("login")
	public String returnFormLogin() {
		return"login";
	}
	
	
	@RequestMapping("acesso-negado")
	public String acessoNegado() {
		return "access-denied";
	}
	
	@RequestMapping("about")
	public String returnAbout() {
		return "about";
	}

	
}
