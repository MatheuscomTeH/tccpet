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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dao.AgendamentoDao;
import web.dao.AnimalDao;
import web.dao.ClienteDao;
import web.dao.EnderecoDao;
import web.dao.ServicoDao;
import web.dao.UsuarioDao;
import web.model.Agendamento;
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
	private AgendamentoDao agendamentoDao;
	
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
		Cliente cliente = usuarioDao.findByEmail(email).getCliente();
		
		model.addAttribute("listaDeEnderecos",enderecoDao.listarEnderecoDoCliente(cliente.getId()));
		model.addAttribute("servicos", servicoDao.listar());
		model.addAttribute("cliente", cliente);

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
	

	
	@RequestMapping("remove-animal")
	public String removeAnimal(long id) {
		if(animalDao.buscaPorId(id)!= null) {
			animalDao.remove(id);
			
		}
		return "redirect:lista-animal";
	}
   
	
	//endereco
	

	@RequestMapping("lista-endereco")
	public String listaEndereco(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		model.addAttribute("enderecos",enderecoDao.listarEnderecoDoCliente(usuarioDao.findByEmail(email).getCliente().getId()));
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
		return "cliente/endereco/lista";
	}

	@RequestMapping("novo-endereco")
	public String novoEndereco(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
		return "cliente/endereco/novo";

	}

	@RequestMapping("adiciona-endereco")
	public String adicionaEndereco(@Valid Endereco endereco, BindingResult result) {

		if (result.hasErrors()) {
			return "redirect:novo-endereco";
		}
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		endereco.setCliente(usuarioDao.findByEmail(email).getCliente());
		enderecoDao.adiciona(endereco);
		return "redirect:lista-endereco";

	}
	
	@RequestMapping("edita-endereco")
	public String editaEndereco(long id,Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
		model.addAttribute("endereco",enderecoDao.buscaPorId(id));
		return "cliente/endereco/edita";
	}
	
	@RequestMapping("altera-endereco")
	public String alteraEndereco(@Valid Endereco endereco,BindingResult result) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		Usuario usuario = usuarioDao.findByEmail(email);
		
		if(result.hasErrors() || usuario != null && endereco.getCliente().getId() !=usuario.getCliente().getId()) {
			return "redirect:lista-endereco?id="+endereco.getId();
		}
		
	
		enderecoDao.alterar(endereco);
		
		
		return "redirect:lista-endereco";
		
	}
	

	
	@RequestMapping("remove-endereco")
	public String removeEndereco(long id) {
		if(enderecoDao.buscaPorId(id)!= null) {
			enderecoDao.remove(id);
			
		}
		return "redirect:lista-endereco";
	}
	
	// Agendamento
	
    @PostMapping("adiciona-agendamento")
    public String adicionaAgendamento(@Valid Agendamento agendamento,BindingResult result) {
    	 if(result.hasErrors()) {
    	  return	"redirect:index";
    	}
    	 agendamento.setStatus("Pendente");
    	agendamentoDao.adiciona(agendamento);
    	return "redirect:lista-agendamento";
    }
    
    @GetMapping("lista-agendamento")
    public String listaAgendamento(Model model) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		Usuario usuario = usuarioDao.findByEmail(email);
		model.addAttribute("cliente", usuarioDao.findByEmail(email).getCliente());
    	model.addAttribute("agendamentos",agendamentoDao.listarAgendamentosPorClienteId(usuario.getCliente().getId()));
    	return "cliente/agendamento/lista";
    }
    
    @GetMapping("remove-agendamento")
    public String removeAgendamento(long id) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String email = authentication.getName();
		Usuario usuario = usuarioDao.findByEmail(email);
    	if(agendamentoDao.buscaPorId(id) != null && agendamentoDao.buscaPorId(id).getCliente().getId() == usuario.getCliente().getId()) {
    		agendamentoDao.remove(id);
    	}
    	
    	return "redirect:lista-agendamento";
    	
    }
   
    
}