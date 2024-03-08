package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.aulas;

import javax.swing.JOptionPane;

public class FatorialP {

    static void fatP(int n, int x, int f) {
        if (x == 0 || x == 1) {
            System.out.println("O fatorial de " + n + " é " + f); // Regra 1
        } else {
            // Chamada da função recursiva
            fatP(n, x - 1, f * x); // Regra 2 e 3
        }
    }

    public static void main(String[] args) {
        int nro;
        nro = Integer.parseInt(JOptionPane.showInputDialog("Digite um valor que deseja saber o fatorial"));
        if (nro < 0) {
            System.out.println("Valor inválido para o cálculo de fatorial, o valor precisa ser maior ou igual a zero");
            System.exit(0);
        } else {
            fatP(nro, nro, 1); // Chamada da função recursiva
        }
        System.exit(0);
    }

}
