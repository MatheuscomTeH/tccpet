package web.controller;

import java.util.List;

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
import web.dao.EnderecoDao;
import web.dao.ServicoDao;
import web.dao.UsuarioDao;
import web.model.Animal;
import web.model.Cliente;
import web.model.Endereco;
import web.model.Role;
import web.model.Usuario;

@Controller
@RequestMapping("cliente")
@Transactional
public class ClienteController {
	
	@Autowired
	private EnderecoDao enderecoDao;
	
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
	
	@RequestMapping("edita-animal")
	public String editaAnimal(long id,Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
		model.addAttribute("animal",animalDao.buscaPorId(id));
		return "cliente/animal/edita";
	}
	
	@RequestMapping("altera-animal")
	public String alteraAnimal(@Valid Animal animal,BindingResult result) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		Usuario user = usuarioDao.findByEmail(email);
		Animal newAnimal = animalDao.buscaPorId(animal.getId());
		if(result.hasErrors() || user == null || newAnimal == null) {
			return "redirect:lista-animal?id="+animal.getId();
		}
		
	
		for(Animal a : user.getCliente().getAnimais() ) {
			if(a.getId() == newAnimal.getId()) {
				newAnimal.setIdade(animal.getIdade());
				newAnimal.setNome(animal.getNome());
				newAnimal.setTipo(animal.getTipo());
				
			}
		}
		
		
		
		return "redirect:lista-animal";
		
	}
	
	@RequestMapping("remove-endereco")
	public String removeEndereco(long id) {
		if(enderecoDao.buscaPorId(id)!= null) {
			enderecoDao.remove(id);
			
		}
		return "redirect:lista-endereco";
	}
    // Novo método para retornar todos os endereços de um cliente pelo ID
    public List<Endereco> listarEnderecoDoCliente(long clienteId) {
        return manager.createQuery("select e from Endereco e where e.cliente.id = :clienteId", Endereco.class)
                .setParameter("clienteId", clienteId)
                .getResultList();
    }
}