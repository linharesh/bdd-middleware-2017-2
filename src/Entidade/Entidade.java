package Entidade;

import java.util.ArrayList;

public class Entidade {
	
	private String nome;
	private ArrayList<Fragmento> fragmentos = new ArrayList<Fragmento>();
	
	public Entidade(String nome) {
		super();
		this.nome = nome;
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
