package descomplica.p1B.criacaoAplicacoesSistemas.java2Introducao;

public class Java4 {
    
    public static void main (String entrada[]) {
        int n1, n2;
        int mod, div;
        double raiz, pot;
        String msg = "";

        // entrada de dados
        //n1 = Integer.parseInt(entrada[0]);
        n1 = 5;
        //n2 = Integer.parseInt(entrada[1]);
        n2 = 3;

        // processamento
        mod = n1 % n2;
        div = (int)n1 / (int)n2;
        raiz = Math.sqrt(n1);
        pot = Math.pow(n1, n2);

        // saída de resultados
        msg = msg + "n1 = " + n1 + " ne = " + n2 + "\n";
        msg = msg + "resto da divisao de n1 por n2 = " + mod + "\n";
        msg = msg + "quociente da divisao de n1 por n2 = " + div + "\n";
        msg = msg + "raiz qudrada de n1 = " + raiz + "\n";
        msg = msg + "potencia de n1 por n2 = " + pot + "\n";
        System.out.println(msg);
         
        System.exit(0);
    }
    
}