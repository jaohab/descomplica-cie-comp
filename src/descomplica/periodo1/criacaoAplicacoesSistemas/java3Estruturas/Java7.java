package descomplica.periodo1.criacaoAplicacoesSistemas.java3Estruturas;

import javax.swing.*;

public class Java7 {
    
    public static void main (String entrada[]) {

        int num;
        char op = '0';
        String msg = "", msgEntr = "Digite 1 para par/impar\nDigite 2 para positivo/nao positivo\n";
    
        // entrada de dados
        num = Integer.parseInt(JOptionPane.showInputDialog("Digite um numero inteiro"));
        op = (JOptionPane.showInputDialog(msgEntr)).charAt(0);
        
        // processamento
        switch (op) {
            case '1': {
                if (num % 2 == 0) {
                    msg = msg + num + " é par.\n\n";
                } else {
                    msg = msg + num + " é impar.\n\n";
                }
                break;
            }
            case '2': {
                if (num > 0) {
                    msg = msg + num + " é positivo.\n\n";
                } else {
                    msg = msg + num + " é não positivo.\n\n";
                }
                break;
            }
            default: JOptionPane.showMessageDialog(null, "Opção inválida, calculos não realizados");
        }
    
        //saída de resultados
        if (op == '1' || op == '2') {
            JOptionPane.showMessageDialog(null, msg);
        }
    
        System.exit(0);
    }

} 
