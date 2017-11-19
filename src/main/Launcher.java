package main;

import java.util.ArrayList;

import Entidade.Entidade;
import fileInterface.JSONReader;

public class Launcher {
	
	public static void main(String[] args) {
		JSONReader jsonReader = new JSONReader();
		ArrayList<Entidade> entidades = jsonReader.lerArquivoJson();
		ConsoleInterface console = new ConsoleInterface();
		console.iniciaInterfaceConsole();
	}

}
