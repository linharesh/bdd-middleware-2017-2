package dbconnection;

import java.util.HashMap;

public class ResultInstance {
	
	private HashMap<String, String> attributes = new HashMap<String, String>();
	
	public void inserir(String chave, String valor) {
		this.attributes.put(chave, valor);
	}

}
