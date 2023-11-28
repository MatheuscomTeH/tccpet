package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import web.model.Endereco;

@Repository
public class EnderecoDao {
	

	
	
	@PersistenceContext
	private EntityManager manager;
	
	public void adiciona(Endereco endereco) {
		manager.persist(endereco);
	}

	public void alterar(Endereco endereco) {
		manager.merge(endereco);
	}

	public List<Endereco> listar() {
		return manager.createQuery("select e from Endereco e", Endereco.class).getResultList();
	}
	

	public Endereco buscaPorId(long id) {
		return manager.find(Endereco.class, id);
	}

	public void remove(long id) {
		manager.createQuery("delete from Endereco e where e.id = :id").setParameter("id", id).executeUpdate();
	}


}
