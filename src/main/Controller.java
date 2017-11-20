package main;

import java.util.ArrayList;
import java.util.Scanner;

import Entidade.Entidade;
import Entidade.Fragmento;
import dbconnection.MySQLConnection;
import dbconnection.Site;
import fileInterface.JSONReader;

public class Controller {

	private ArrayList<Entidade> entidades;
	private ArrayList<Site> sites;
	private ArrayList<MySQLConnection> connections;

	private Scanner scanner = new Scanner(System.in);

	public void inicializaApp() {
		JSONReader jsonReader = new JSONReader();
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
		String line = scanner.nextLine().toUpperCase(); //.replaceAll(" ", "");
		if (line.equals("EXIT")) {
			finalizaApp();
		} else {
			try {
				processaQuery(line);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				leLinhaConsole();				
			}
		}

	}

	private void processaQuery(String query) throws Exception {
		if (query.isEmpty()) {
			throw new Exception("Query vazia");
		}
		System.out.println("Processando consulta: " + query);
		query = query.replaceAll(";", "");
		String afterFROM = query.split("FROM")[1];
		String entities = afterFROM.split("WHERE")[0].replaceAll(" ", "");
		if (entities.contains(",")) {
			// Mais de uma entidade
			throw new Exception("Funcao ainda nao suportada ");
		} else {
			// Apenas uma entidade
			Entidade e = buscaEntidadePorNome(entities);
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
		throw new Exception("Entidade desconhecida: "+nome);
	}
	
	private MySQLConnection buscaConexaoPorSiteId(String id) throws Exception {
		for (MySQLConnection msc : connections) {
			if (msc.getSite().getId().equalsIgnoreCase(id))
				return msc;
		}
		throw new Exception("Site desconhecido: "+id);
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
