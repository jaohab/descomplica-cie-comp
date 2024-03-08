package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.aulas;

import javax.swing.*;

public class Somar1 {
    public static void main(String[] args) {

        int vetSoma[], i, soma = 0;
        vetSoma = new int[10];

        for (i = 0; i <= 9; i++) {
            vetSoma[i] = Integer.parseInt(JOptionPane.showInputDialog("Digite um valor inteiro."));
            soma = soma + vetSoma[i];
        }
        System.out.println("A soma dos 10 valores digitados é: " + soma);
        System.exit(0);
    }

}
