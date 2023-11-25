package web.model;

public enum Role {
	ADMIN("ADMIN"), CLIENTE("CLIENTE"), FUNCIONARIO("FUNCIONARIO");

	private String nome;

	private Role(String nome) {
		this.nome = nome;
	}
	
	public String getNome() {
		return this.nome;
	}
}
