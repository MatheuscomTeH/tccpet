package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import web.model.Animal;

@Repository
public class AnimalDao {


		
		
		@PersistenceContext
		private EntityManager manager;
		
		public void adiciona(Animal animal) {
			manager.persist(animal);
		}

		public void alterar(Animal animal) {
			manager.merge(animal);
		}

		public List<Animal> listar() {
			return manager.createQuery("select a from Animal a", Animal.class).getResultList();
		}
		
		public void deleteAnimaisByClienteId(long clienteId) {
		    Query query = manager.createQuery("DELETE FROM Animal a WHERE a.cliente.id = :clienteId");
		    query.setParameter("clienteId", clienteId);
		    
		}

		public Animal buscaPorId(long id) {
			return manager.find(Animal.class, id);
		}

		public void remove(long id) {
			manager.createQuery("delete from Animal a where a.id = :id").setParameter("id", id).executeUpdate();
		}

	}


