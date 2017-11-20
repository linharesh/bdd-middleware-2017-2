package fileInterface;

import java.io.FileReader;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import Entidade.Entidade;
import Entidade.Fragmento;
import dbconnection.Site;

public class JSONReader {

	public ArrayList<Entidade> lerArquivoEntities() {

		ArrayList<Entidade> entidades = new ArrayList<Entidade>();
		JSONParser parser = new JSONParser();
		System.out.println("Lendo entidades..");
		try {
			JSONObject jsonObject = (JSONObject) parser.parse(new FileReader("entities.json"));
			JSONArray entities = (JSONArray) jsonObject.get("Entities");
			for (Object e : entities) {
				JSONObject entity = (JSONObject) e;
				Entidade entidade = new Entidade((String) entity.get("name"));
				ArrayList<Fragmento> fragmentos = new ArrayList<Fragmento>();
				JSONArray frags = (JSONArray) entity.get("fragments");
				for (Object f : frags) {
					JSONObject frag = (JSONObject) f;
					String name = (String) frag.get("name");
					String siteid = (String) frag.get("site-id");
					fragmentos.add(new Fragmento(name, siteid));
				}
				entidade.setFragmentos(fragmentos);
				System.out.println("Entidade lida: " + entidade.getNome());
				entidades.add(entidade);
			}

		} catch (Exception e) {
			System.out.println("Erro ao ler entidades:");
			e.printStackTrace();
		}
		System.out.println("Leitura de entidades finalizada.");
		return entidades;

	}

	public ArrayList<Site> lerArquivoSites() {

		ArrayList<Site> sites = new ArrayList<Site>();
		JSONParser parser = new JSONParser();
		System.out.println("Lendo sites..");
		try {
			JSONObject jsonObject = (JSONObject) parser.parse(new FileReader("sites.json"));
			JSONArray sitesJson = (JSONArray) jsonObject.get("Sites");
			for (Object s : sitesJson) {
				JSONObject site = (JSONObject) s;
				String id = (String) site.get("ID");
				String url = (String) site.get("URL");
				String username = (String) site.get("USERNAME");
				String password = (String) site.get("PASSWORD");
				System.out.println("Site lido: " + id);
				sites.add(new Site(id, url, username, password));
			}

		} catch (Exception e) {
			System.out.println("Erro ao ler sites:");
			e.printStackTrace();
		}
		System.out.println("Leitura de sites finalizada.");
		return sites;

	}

}
