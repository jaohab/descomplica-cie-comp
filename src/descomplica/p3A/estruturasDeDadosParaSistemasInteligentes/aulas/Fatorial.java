package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.aulas;

import javax.swing.JOptionPane;

public class Fatorial {
    static int fat(int n) {
        int f;
        if (n == 0) {
            return 1; // Regra 1
        } else {
            // Chamada da função recursiva
            f = n * fat(n - 1); // Regra 2 e 3
            return f;
        }
    }

    public static void main(String[] args) {
        int f, nro;
        nro = Integer.parseInt(JOptionPane.showInputDialog("Digite um valor que deseja saber o fatorial"));
        if (nro < 0) {
            System.out.println("Valor inválido para o cálculo de fatorial, o valor precisa ser maior ou igual a zero");
            System.exit(0);
        } else {
            f = fat(nro); // Chamada da função recursiva
            System.out.println("O fatorial de " + nro + " é " + f);
        }
        System.exit(0);
    }

}
