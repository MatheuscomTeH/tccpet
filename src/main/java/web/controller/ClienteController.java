package web.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dao.ClienteDao;
import web.dao.UsuarioDao;
import web.model.Cliente;
import web.model.Role;
import web.model.Usuario;

@Controller
@RequestMapping("cliente")
@Transactional
public class ClienteController {

	@Autowired
	private UsuarioDao usuarioDao;

	@Autowired
	private ClienteDao dao;

	@Autowired
	private PasswordEncoder encoder;

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

}
