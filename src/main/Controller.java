package main;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

import Entidade.Entidade;
import Entidade.Fragmento;
import dbconnection.MySQLConnection;
import dbconnection.Site;
import filereader.JSONFileParser;

public class Controller {

	private ArrayList<Entidade> entidades;
	private ArrayList<Site> sites;
	private ArrayList<MySQLConnection> connections;

	private Scanner scanner = new Scanner(System.in);

	public void inicializaApp() {
		JSONFileParser jsonReader = new JSONFileParser();
		this.entidades = jsonReader.lerArquivoEntities();
		this.sites = jsonReader.lerArquivoSites();
		inicializaConexoes();
		iniciaInterfaceConsole();
	}

	public void finalizaApp() {
		System.out.println("Encerrando conexoes com sites...");
		for (MySQLConnection cnn : this.connections) {
			cnn.close();
		}
		System.out.println("App encerrado");
	}

	public void iniciaInterfaceConsole() {
		System.out.println("# BDD MIDDLEWARE # ");
		System.out.println("# Middleware para processamento de consultas em banco de dados distribuidos");
		System.out.println("# Digite uma query ou EXIT para sair");
		this.leLinhaConsole();
	}

	public void leLinhaConsole() {
		System.out.print("& ");
		String line = scanner.nextLine().toUpperCase();
		while (!line.equals("EXIT")) {
			try {
				processaQuery(line);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.print("& ");
				line = scanner.nextLine().toUpperCase();
			}
		}
		finalizaApp();
	}

	private void processaQuery(String query) throws Exception {
		if (query.isEmpty()) {
			throw new Exception("Query vazia");
		}
		System.out.println("Processando consulta: " + query);
		query = query.replaceAll(";", "");
		String afterFROM = query.split("FROM")[1];
		String beforeWhere = afterFROM.split("WHERE")[0]; // .replaceAll(" ", "");
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

			ArrayList<Entidade> entidadesArrL = new ArrayList<Entidade>();

			for (String nomeEntidade : nomeDasEntidades) {
				entidadesArrL.add(buscaEntidadePorNome(nomeEntidade));
			}

			ArrayList<Site> sitesInQuery = new ArrayList<Site>();

			for (Entidade ent : entidadesArrL) {
				for (Fragmento frag : ent.getFragmentos()) {
					Site site = buscaSitePorSiteId(frag.getSiteid());
					if (!sitesInQuery.contains(site))
						sitesInQuery.add(site);
				}
			}

			for (Site site : sitesInQuery) {
				String qqueryPart = query;
				for (Entidade e : entidadesArrL) {
					for (Fragmento frag : e.getFragmentos()) {
						if (site.getId().equalsIgnoreCase(frag.getSiteid()))
							qqueryPart = qqueryPart.replaceAll(e.getNome().toUpperCase(), frag.getNome().toUpperCase());
					}
				}
				MySQLConnection mysqlcnn = buscaConexaoPorSiteId(site.getId());
				mysqlcnn.runQuery(qqueryPart + ";");
			}

		} else {
			beforeWhere = beforeWhere.replace(" ", "");
			// Apenas uma entidade
			Entidade e = buscaEntidadePorNome(beforeWhere);
			ArrayList<Fragmento> frags = e.getFragmentos();
			for (Fragmento frag : frags) {
				MySQLConnection mysqlcnn = buscaConexaoPorSiteId(frag.getSiteid());
				mysqlcnn.runQuery(query.replaceAll(e.getNome().toUpperCase(), frag.getNome().toUpperCase()) + ";");
			}

		}
	}

	private Entidade buscaEntidadePorNome(String nome) throws Exception {
		for (Entidade e : entidades) {
			if (e.getNome().equalsIgnoreCase(nome))
				return e;
		}
		throw new Exception("Entidade desconhecida: " + nome);
	}

	private MySQLConnection buscaConexaoPorSiteId(String id) throws Exception {
		for (MySQLConnection msc : connections) {
			if (msc.getSite().getId().equalsIgnoreCase(id))
				return msc;
		}
		throw new Exception("Site desconhecido: " + id);
	}

	private Site buscaSitePorSiteId(String id) throws Exception {
		for (Site site : this.sites) {
			if (site.getId().equalsIgnoreCase(id))
				return site;
		}
		throw new Exception("Site desconhecido: " + id);
	}

	private void inicializaConexoes() {
		this.connections = new ArrayList<MySQLConnection>();
		System.out.println("Inicializando conexoes com sites...");
		for (Site site : sites) {
			MySQLConnection mySqlCnn = new MySQLConnection(site);
			mySqlCnn.connect();
			this.connections.add(mySqlCnn);
		}
	}

}
