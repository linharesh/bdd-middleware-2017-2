package dbconnection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;

import entidade.Entidade;
import entidade.Fragmento;

public class ProcessadorDeConsulta {

	private ArrayList<Entidade> entidades;
	private ArrayList<Site> sites;

	public ProcessadorDeConsulta(ArrayList<Entidade> entidades, ArrayList<Site> sites) {
		this.entidades = entidades;
		this.sites = sites;
	}

	public Hashtable<String, Site> processarConsulta(String query) throws Exception {
		if (query.isEmpty())
			throw new Exception("Consulta vazia");

		query = query.toUpperCase();
		System.out.println("Processando consulta: " + query);

		ArrayList<Entidade> entidadesNaConsulta = extrairEntidadesDeConsulta(query);
		ArrayList<Site> sitesNaConsulta = new ArrayList<Site>();
		Hashtable<String, Site> subconsultas = new Hashtable<String, Site>();

		for (Entidade ent : entidadesNaConsulta) {
			for (Fragmento frag : ent.getFragmentos()) {
				Site site = buscaSitePorSiteId(frag.getSiteid());
				if (!sitesNaConsulta.contains(site))
					sitesNaConsulta.add(site);
			}
		}

		for (Site site : sitesNaConsulta) {
			String queryPart = query; //.replaceAll(",", ", ");
			for (Entidade e : entidadesNaConsulta) {
				for (Fragmento frag : e.getFragmentos()) {
					if (site.getId().equalsIgnoreCase(frag.getSiteid())) {
						queryPart = queryPart.replaceAll(e.getNome().toUpperCase(), frag.getNome().toUpperCase());
					}
				}
			}
			System.out.println(queryPart);
			subconsultas.put(queryPart, site);
		}
		return subconsultas;
	}

	private ArrayList<Entidade> extrairEntidadesDeConsulta(String query) throws Exception {
		query = query.replaceAll(";", "");
		ArrayList<Entidade> entidadesArrL = new ArrayList<Entidade>();
		String afterFrom = query.split("FROM")[1];
		String beforeWhere = afterFrom.split("WHERE")[0];
		if (beforeWhere.contains(",") || beforeWhere.contains("JOIN")) {
			// Mais de uma entidade
			ArrayList<String> nomeDasEntidades = null;
			if (beforeWhere.contains(",")) {
				nomeDasEntidades = new ArrayList<String>(Arrays.asList(beforeWhere.replaceAll(" ", "").split(",")));
			} else if (beforeWhere.contains("JOIN")) {
				nomeDasEntidades = new ArrayList<String>();
				String[] splitQuery = beforeWhere.split("JOIN");
				for (int k = 0; k < splitQuery.length; k++) {
					if (splitQuery[k].contains(" ON ")) {
						nomeDasEntidades.add(splitQuery[k].split(" ON ")[0].replaceAll(" ", ""));
					} else {
						nomeDasEntidades.add(splitQuery[k].replaceAll(" ", ""));
					}
				}
			}

			for (String nomeEntidade : nomeDasEntidades) {
				entidadesArrL.add(buscaEntidadePorNome(nomeEntidade));
			}
			return entidadesArrL;

		} else {
			// Apenas uma entidade
			beforeWhere = beforeWhere.replace(" ", "");
			beforeWhere = beforeWhere.replace(";", "");
			Entidade e = buscaEntidadePorNome(beforeWhere);
			entidadesArrL.add(e);
			return entidadesArrL;
		}
	}

	private Entidade buscaEntidadePorNome(String nome) throws Exception {
		for (Entidade e : entidades) {
			if (e.getNome().equalsIgnoreCase(nome))
				return e;
		}
		throw new Exception("Entidade desconhecida:" + nome);
	}

	private Site buscaSitePorSiteId(String id) throws Exception {
		for (Site site : this.sites) {
			if (site.getId().equalsIgnoreCase(id))
				return site;
		}
		throw new Exception("Site desconhecido:" + id);
	}

}
