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

import web.dao.AgendamentoDao;
import web.dao.ClienteDao;
import web.dao.FuncionarioDao;
import web.dao.UsuarioDao;
import web.model.Agendamento;
import web.model.Cliente;
import web.model.Funcionario;
import web.model.Role;
import web.model.Usuario;

@Transactional
@Controller
@RequestMapping("/funcionario")
public class FuncionarioController {

		@Autowired
		private UsuarioDao usuarioDao;
		
		@Autowired
		private FuncionarioDao funcionarioDao;
		
		@Autowired
		private AgendamentoDao agendamentoDao;

		@Autowired
		private ClienteDao clienteDao;

		@Autowired
		private PasswordEncoder encoder;


		@RequestMapping("index")
		public String home(Model model) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String email = authentication.getName();
			Usuario usuario = usuarioDao.findByEmail(email);
			Funcionario funcionario = funcionarioDao.findFuncionarioByUsuarioEmail(usuario.getEmail());
			model.addAttribute("funcionario",funcionario);
			return "funcionario/index";

		}

		@RequestMapping("/novo-cliente")
		public String novoCliente() {
			
			return "funcionario/cliente/novo";
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
			return "funcionario/cliente/lista";
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
			return "funcionario/cliente/exibe";
		}

		@RequestMapping("/edita-cliente")
		public String editaCliente(long id, Model model) {
			model.addAttribute("cliente", clienteDao.buscaPorId(id));
			return "funcionario/cliente/edita";
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
		
		//agendamento
		
		@RequestMapping("lista_agendamento")
		public String listaAgendamentoPendente(Model model) {
			
			model.addAttribute("agendamentos",agendamentoDao.listarAgendamentosSemFuncionarios());
			return "funcionario/agendamento/lista";
			
		}
		
		@RequestMapping("lista_agendamentoA")
		public String listaAgendamentoAceito(Model model) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String email = authentication.getName();
			Usuario usuario = usuarioDao.findByEmail(email);
			Funcionario funcionario = funcionarioDao.findFuncionarioByUsuarioEmail(usuario.getEmail());
			
			model.addAttribute("agendamentos",agendamentoDao.listarAgendamentosPorIdFuncionarioEStatus(funcionario.getId()));
			return "funcionario/agendamento/listaA";
			
		}
		
		@RequestMapping("lista_agendamentoC")
		public String listaAgendamentoConcluido(Model model) {		
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String email = authentication.getName();
			Usuario usuario = usuarioDao.findByEmail(email);
			Funcionario funcionario = funcionarioDao.findFuncionarioByUsuarioEmail(usuario.getEmail());

			model.addAttribute("agendamentos",agendamentoDao.listarAgendamentosPorIdFuncionarioEStatusConcluido(funcionario.getId()));
			return "funcionario/agendamento/listaC";
			
		}
		
		@RequestMapping("aceitar-agendamento")
		public String aceitarAgendamento(long id) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String email = authentication.getName();
			Usuario usuario = usuarioDao.findByEmail(email);
			
			
			if(agendamentoDao.buscaPorId(id) != null) {
				Agendamento agendamento = agendamentoDao.buscaPorId(id) ;
				agendamento.setFuncionario(funcionarioDao.buscarPorIdUsuario(usuario.getId()));
				agendamento.setStatus("Aceito");
			}
			
			return "redirect:lista_agendamento";
			
		}
		
		@RequestMapping("concluir-agendamento")
		public String concluirAgendamento(long id){
			
			if(agendamentoDao.buscaPorId(id) != null) {
				Agendamento agendamento = agendamentoDao.buscaPorId(id) ;
				agendamento.setDevolvido(true);
				agendamento.setStatus("Concluido");
			}
			
			return "redirect:lista_agendamentoA";
		}
		
		@RequestMapping("cancelar-agendamento")
		public String cancelarAgendamento(long id){
				
			if(agendamentoDao.buscaPorId(id) != null) {
				Agendamento agendamento = agendamentoDao.buscaPorId(id) ;
				agendamento.setStatus("Cancelado");
			}
			
			return "redirect:lista_agendamentoA";
		}
		
		@RequestMapping("recusar-agendamento")
		public String recusarAgendamento(long id) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String email = authentication.getName();
			Usuario usuario = usuarioDao.findByEmail(email);
			
			
			if(agendamentoDao.buscaPorId(id) != null) {
				Agendamento agendamento = agendamentoDao.buscaPorId(id) ;
				agendamento.setFuncionario(funcionarioDao.buscarPorIdUsuario(usuario.getId()));
				agendamento.setStatus("Recusado");
			}
			
			return "redirect:lista_agendamento";
			
		}
		
		
		@RequestMapping("exibe-agendamento")
		public String exbibeAgendamento(long id, Model model) {
			
			if(agendamentoDao.buscaPorId(id) != null) {
				
				model.addAttribute("agendamento",agendamentoDao.buscaPorId(id));
				return "funcionario/agendamento/exibe";
			}
			
			return "redirect:lista_agendamento";
			
		}
		
		@RequestMapping("remove-agendamento")
		public String removeAgendamento(long id) {
			if(agendamentoDao.buscaPorId(id) != null) {
				agendamentoDao.remove(id);
			}
			
			return "redirect:lista_agendamentoC";
			
		}
}
