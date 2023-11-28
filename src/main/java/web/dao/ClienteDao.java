package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;


import org.springframework.stereotype.Repository;

import web.model.Cliente;

@Repository
public class ClienteDao {
	@PersistenceContext
	private EntityManager manager;
	
	public void adiciona(Cliente cliente) {
		manager.persist(cliente);
	}

	public void alterar(Cliente cliente) {
		manager.merge(cliente);
	}

	public List<Cliente> listar() {
		return manager.createQuery("select c from Cliente c", Cliente.class).getResultList();
	}

	public Cliente buscaPorEmail(String email) {
		try {
			return manager.createQuery("SELECT c FROM Cliente c WHERE c.email = :email", Cliente.class)
					.setParameter("email", email).getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}

	public Cliente buscaPorId(long id) {
		return manager.find(Cliente.class, id);
	}
	
	

	public void remove(long id) {
		manager.createQuery("delete from Cliente c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
