package entidade;

public class Fragmento {

	private String nome;
	private String siteid;

	public Fragmento(String nome, String siteid) {
		super();
		this.nome = nome;
		this.siteid = siteid;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSiteid() {
		return siteid;
	}

	public void setSiteid(String siteid) {
		this.siteid = siteid;
	}

}
