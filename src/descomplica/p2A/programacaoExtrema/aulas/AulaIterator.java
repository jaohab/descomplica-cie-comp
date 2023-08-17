package descomplica.p2A.programacaoExtrema.aulas;

import java.util.ArrayList;
import java.util.Iterator;

public class AulaIterator {

    public static void main(String[] args) {
        
        ArrayList<String> listaNome = new ArrayList<>();

        listaNome.add("Nome 1");
        listaNome.add("Nome 2");
        listaNome.add("Nome 3");
        listaNome.add("Nome 4");
        listaNome.add("Nome 5");

        // Usando for each

        for (String nome : listaNome) {
            System.out.println(nome);
        }

        // Usando Iterator

        Iterator<String> i = listaNome.iterator();

        while(i.hasNext()) {
            System.out.println(i.next());
        }


    }
    
}
