package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.praticas;

import javax.swing.JOptionPane;

public class Pratica1 {
    public static void main(String[] args) {
        int num[] = new int[50];
        int media, soma = 0;

        for (int i = 0; i <= 49; i++) {
            num[i] = Integer.parseInt(JOptionPane.showInputDialog(i + 1 + "# - Digite um número"));
            soma = soma + num[i];
        }
        media = soma / 50;
        System.out.println(("A média das 50 notas digitadas é: " + media));
    }

}
