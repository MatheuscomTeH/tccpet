package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import web.model.Funcionario;

@Repository
public class FuncionarioDao {


	@PersistenceContext
	private EntityManager manager;
	
	
	public void adiciona(Funcionario funcionario) {
		
		manager.persist(funcionario);
		
	}
	
	public void alterar(Funcionario funcionario) {
		
		manager.merge(funcionario);
	}
	
	public List<Funcionario> listar() {
		return manager.createQuery("select f from Funcionario f", Funcionario.class).getResultList();
	}
	public Funcionario consultar(long id) {
		return manager.find(Funcionario.class, id);
		
	}
	public void remove(long id) {
		manager.createQuery("delete from Funcionario f where f.id = :id").setParameter("id", id).executeUpdate();
	}
	public Funcionario buscaPorCPF(String cpf) {
		try {
			return manager.createQuery("SELECT f FROM Funcionario f WHERE f.cpf = :cpf", Funcionario.class)
					.setParameter("cpf", cpf).getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}
	
	public Funcionario findFuncionarioByUsuarioEmail(String email) {
        String jpql = "SELECT f FROM Funcionario f JOIN f.usuario u WHERE u.email = :email";
        Query query = manager.createQuery(jpql, Funcionario.class);
        query.setParameter("email", email);

        try {
            return (Funcionario) query.getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; 
        }
    }
	
	public Funcionario buscarPorIdUsuario(long idUsuario) {
	    try {
	        String jpql = "SELECT f FROM Funcionario f WHERE f.usuario.id = :idUsuario";
	        return manager.createQuery(jpql, Funcionario.class)
	                .setParameter("idUsuario", idUsuario)
	                .getSingleResult();
	    } catch (NoResultException ex) {
	        return null;
	    }
	}
	
}
