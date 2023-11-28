package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.model.Agendamento;

@Repository
public class AgendamentoDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void adiciona(Agendamento agendamento) {
		manager.persist(agendamento);
	}

	public void alterar(Agendamento agendamento) {
		manager.merge(agendamento);
	}

	public List<Agendamento> listar() {
		return manager.createQuery("select a from Agendamento a", Agendamento.class).getResultList();
	}

	public List<Agendamento> listarAgendamentosPorClienteId(long clienteId) {
		String jpql = "select a from Agendamento a "
				+ "where a.cliente.id = :clienteId";

		return manager.createQuery(jpql, Agendamento.class)
				.setParameter("clienteId", clienteId)
				.getResultList();
	}
	
	public List<Agendamento> listarAgendamentosSemFuncionarios() {
	    String jpql = "select a from Agendamento a "
	            + "where a.funcionario is null";

	    return manager.createQuery(jpql, Agendamento.class)
	            .getResultList();
	}

	public Agendamento buscaPorId(long id) {
		return manager.find(Agendamento.class, id);
	}

	public void remove(long id) {
		manager.createQuery("delete from Agendamento a where a.id = :id").setParameter("id", id).executeUpdate();
	}


}
