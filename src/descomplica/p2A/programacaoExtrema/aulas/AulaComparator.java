package descomplica.p2A.programacaoExtrema.aulas;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class AulaComparator {

    public static void main(String[] args) {
        
        ArrayList<String> listaNome = new ArrayList<>();

        listaNome.add("Oswaldo");
        listaNome.add("Gisele");
        listaNome.add("Carlos");
        listaNome.add("Mauro");
        listaNome.add("Reinaldo");

        System.out.println("Elementos antes da ordenação:");

        for (String nome : listaNome) {
            System.out.println(nome);
        }

        Comparator<String> c = Collections.reverseOrder();
        Collections.sort(listaNome, c);

        System.out.println("Elementos depois da ordenação:");

        for (String nome : listaNome) {
            System.out.println(nome);
        }


    }
    
}
