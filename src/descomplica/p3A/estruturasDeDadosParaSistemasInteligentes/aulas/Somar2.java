package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.aulas;

import javax.swing.JOptionPane;

public class Somar2 {

    public static void main(String[] args) {

        int matSoma[][], i, j, soma = 0;
        matSoma = new int[10][12];

        for (i = 0; i <= 9; i++) {
            for (j = 0; j <= 11; j++) {
                matSoma[i][j] = Integer.parseInt(JOptionPane.showInputDialog("Digite um valor inteiro."));
                soma = soma + matSoma[i][j];
            }
        }
        System.out.println("A soma dos 120 valores digitados é: " + soma);
        System.exit(0);
    }

}
