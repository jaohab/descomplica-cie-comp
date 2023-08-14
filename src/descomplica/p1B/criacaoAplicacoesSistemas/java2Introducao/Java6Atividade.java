package descomplica.p1B.criacaoAplicacoesSistemas.java2Introducao;

import javax.swing.*;

public class Java6Atividade {
    
    public static void main (String entrada[]) {
        int n1, n2;
        double div, pot;
        String msg = "";
  
        // entrada de dados
        n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite um numero inteiro"));
        n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite outro numero inteiro"));
  
        // processamento
        div = (double)n1 / (double)n2;
        pot = Math.pow(n1, n2);
  
        // saída de resultados
        msg = msg + "Quociente da divisao de n1 por n2 = " + div + "\n\n";
        msg = msg + "=====================================" + "\n\n";
        msg = msg + "Potencia de n1 por n2 = " + pot;
        JOptionPane.showMessageDialog(null, msg);
           
        System.exit(0);
    }
    
}