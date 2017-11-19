package fileInterface;

import java.io.FileReader;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import Entidade.Entidade;
import Entidade.Fragmento;

public class JSONReader {

	public ArrayList<Entidade> lerArquivoJson() {

		ArrayList<Entidade> entidades = new ArrayList<Entidade>();
		JSONParser parser = new JSONParser();

		try {
			JSONObject jsonObject = (JSONObject) parser.parse(new FileReader("entities.json"));
			JSONArray entities = (JSONArray) jsonObject.get("Entities");
			for (Object e : entities) {
				JSONObject entity = (JSONObject) e;
				Entidade entidade = new Entidade((String) entity.get("name"));
				ArrayList<Fragmento> fragmentos = new ArrayList<Fragmento>();
				JSONArray frags = (JSONArray) entity.get("fragments");
				for (Object f : frags) {
					fragmentos.add(new Fragmento((String) f));
				}
				entidade.setFragmentos(fragmentos);
				entidades.add(entidade);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return entidades;

	}

}
