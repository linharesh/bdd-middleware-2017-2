package main;

import java.util.Scanner;

import ConsoleInterface.ConsoleOptions;

public class ConsoleInterface {
	
	private Scanner scanner = new Scanner(System.in);
	
	public void iniciaInterfaceConsole() {
		System.out.println("# BDD MIDDLEWARE # ");
		System.out.println("# Middleware para processamento de consultas em banco de dados distribuídos");
		System.out.println("# Digite HELP para obter ajuda");
		System.out.print("& ");
		this.leLinhaConsole();
	}
	
	private void leLinhaConsole() {
		String line = scanner.nextLine().toUpperCase();
		
		if (line.equals("HELP")) {
			
		}
		
		if (line.equals("ENTIDADES")) {
			
		}
		
		
		if (line.contains("SELECT")) {
			
		} 
		
		ConsoleOptions.buscaPorOpcao(line);

	}
	
	

}
