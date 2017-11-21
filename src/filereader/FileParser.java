package filereader;

import java.util.ArrayList;

import Entidade.Entidade;
import dbconnection.Site;

public abstract class FileParser {
	
	public abstract ArrayList<Entidade> lerArquivoEntities();
	protected final String PATH_PARA_ARQUIVO_ENTITIES = "entities.json";
	
	public abstract ArrayList<Site> lerArquivoSites();
	protected final String PATH_PARA_ARQUIVO_SITES = "sites.json";
	
}
