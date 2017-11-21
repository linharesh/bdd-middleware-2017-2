package Entidade;

import java.util.ArrayList;

public class Entidade {

	private String nome;
	private ArrayList<Fragmento> fragmentos = new ArrayList<Fragmento>();

	public Entidade(String nome) {
		super();
		this.nome = nome;
	}

	public Fragmento buscaFragmentoPorSiteId(String siteid) throws Exception {
		for (Fragmento f : fragmentos) {
			if (f.getSiteid().equalsIgnoreCase(siteid))
				return f;
		}
		throw new Exception("SiteID não encontrado: "+siteid);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public ArrayList<Fragmento> getFragmentos() {
		return fragmentos;
	}

	public void setFragmentos(ArrayList<Fragmento> fragmentos) {
		this.fragmentos = fragmentos;
	}

}
