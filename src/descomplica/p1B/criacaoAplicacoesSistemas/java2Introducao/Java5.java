package descomplica.p1B.criacaoAplicacoesSistemas.java2Introducao;

import javax.swing.*;

public class Java5 {
    
    public static void main (String entrada[]) {
        int n1, n2, mod;
        double raiz1, raiz2;
        String msg = "";
  
        // entrada de dados
        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um numero inteiro"));
        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro numero inteiro"));
  
        // processamento
        mod = n1 % n2;
        raiz1 = Math.sqrt(n1);
        raiz2 = Math.sqrt(n2);
  
        // saída de resultados
        msg = msg + "resto da divisao de " + n1 + " por " + n2 + " = " + mod + "\n";
        msg = msg + "raiz qudrada de " + n1 + " = " + raiz1 + "\n";
        msg = msg + "raiz qudrada de " + n2 + " = " + raiz2 + "\n";
  
        JOptionPane.showMessageDialog(null, msg);
           
        System.exit(0);
    }
    
}