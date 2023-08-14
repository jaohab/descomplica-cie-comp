package descomplica.p1B.criacaoAplicacoesSistemas.java4Modulos;

import javax.swing.*;

public class Java9 {
    
    public static void soma (int vetor[]) {
        int s = 0;
        for (int i=0; i<vetor.length; i++) {
            s = s + vetor[i];
        }
        JOptionPane.showMessageDialog(null, "A soma e " + s);
    }
        
    public static int produto (int vetor[]) {
        int p = 1;
        for (int i=0; i<vetor.length; i++) {
            p = p * vetor[i];
        }
        return p;
    }
        
    public static void main (String entrada[]) {
        int vetor[] = {3, 4, 5, 6, 7};
        int r;
        
        soma(vetor);
        r = produto(vetor);
        JOptionPane.showMessageDialog(null, "O produto e " + r);
        System.exit(0);
    }

}