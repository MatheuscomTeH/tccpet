package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.model.Servico;

@Repository
public class ServicoDao {
	
	
	@PersistenceContext
	private EntityManager manager;
	
	public void adiciona(Servico servico) {
		manager.persist(servico);
	}

	public void alterar(Servico servico) {
		manager.merge(servico);
	}

	public List<Servico> listar() {
		return manager.createQuery("select s from Servico s", Servico.class).getResultList();
	}


	public Servico buscaPorNome(String nome) {
		try {
			return manager.createQuery("SELECT s FROM Servico s WHERE s.nome = :nome", Servico.class)
					.setParameter("nome", nome).getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}

	public Servico buscaPorId(long id) {
		return manager.find(Servico.class, id);
	}

	public void remove(long id) {
		manager.createQuery("delete from Servico s where s.id = :id").setParameter("id", id).executeUpdate();
	}

}
