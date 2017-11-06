package ConsoleInterface;

public class ConsoleOptions {
	
	public static final String ENTIDADES = "ENTIDADES";
	public static final String HELP = "HELP";
	
	public static String buscaPorOpcao(String input) {
		input = input.replace(" ", "");
		if (input.equalsIgnoreCase(ENTIDADES)) {
			return ENTIDADES;
		} else if (input.equalsIgnoreCase(HELP)) {
			return HELP;
		} else {
			return null;
		}
	}
	

}
