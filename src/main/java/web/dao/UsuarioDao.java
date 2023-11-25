package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.model.Usuario;

@Repository
public class UsuarioDao {
	
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public void adiciona(Usuario usuario) {
		manager.persist(usuario);
	}

	public void alterar(Usuario usuario) {
		manager.merge(usuario);
	}

	public List<Usuario> listar() {
		return manager.createQuery("select u from Usuario u", Usuario.class).getResultList();
	}

	public Usuario findByEmail(String email) {
		try {
			return manager.createQuery("SELECT u FROM Usuario u WHERE u.email = :email", Usuario.class)
					.setParameter("email", email).getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}

	public Usuario buscaPorId(long id) {
		return manager.find(Usuario.class, id);
	}

	public void remove(int id) {
		manager.createQuery("delete from Usuario c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
