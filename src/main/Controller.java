package main;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Scanner;
import java.util.Set;

import entidade.Entidade;
import dbconnection.MySQLConnection;
import dbconnection.ProcessadorDeConsulta;
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
		ProcessadorDeConsulta processador = new ProcessadorDeConsulta(entidades, sites);
		Hashtable<String, Site> subconsultas = processador.processarConsulta(query);
		Set<String> keys = subconsultas.keySet();
		for (String subconsulta : keys) {
			Site site = subconsultas.get(subconsulta);
			MySQLConnection conn = buscaConexaoPorSiteId(site.getId());
			conn.runQuery(subconsulta);
		}
	}

	private MySQLConnection buscaConexaoPorSiteId(String id) throws Exception {
		for (MySQLConnection msc : connections) {
			if (msc.getSite().getId().equalsIgnoreCase(id))
				return msc;
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
