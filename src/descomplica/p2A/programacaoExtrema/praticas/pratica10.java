package descomplica.p2A.programacaoExtrema.praticas;

import java.util.ArrayList;
import java.util.Scanner;

public class pratica10 {

    public static void main(String[] args) {

        ListaNumeros lista = new ListaNumeros();

        Scanner scan = new Scanner(System.in);

        int numero;

        System.out.println("\u001B[34m" + "Digite 0 para encerrar a aplicação." + "\u001B[m");

        while (true) {
            System.out.print("Insira um número: ");

            while (true) {

                try {
                    numero = scan.nextInt();
                    break;
                } catch (Exception e) {
                    System.out.println("\u001B[31m" + "Apenas números são permitidos, tente novamente.\nSe deseja encerrar a aplicação, insira o número 0." + "\u001B[m");
                    scan.nextLine();
                    System.out.print("Insira um número: ");
                }

            }

            if (numero != 0) {
                lista.novoNumero(numero);
                System.out.println("\u001B[32m" + "Número adicionado." + "\u001B[m");
            } else {
                break;
            }
        }

        scan.close();
        System.out.println("\n\u001B[33m" + "Números inseridos: " + "\u001B[m" + lista.imprimirLista());
        System.out.println("\u001B[33m" + "Números somados: " + "\u001B[m" + lista.somarLista());
        System.out.println("\u001B[33m" + "Média dos números inseridos: " + "\u001B[m" + lista.mediaLista());

    }

}

class ListaNumeros {

    ArrayList<Integer> lista = new ArrayList<>();

    ListaNumeros() {
    }

    void novoNumero(int n) {
        this.lista.add(n);
    }

    String imprimirLista() {
        StringBuffer buffer = new StringBuffer();
        for (Integer n : lista) {
            buffer.append(n);
            buffer.append(" ");
        }
        return buffer.toString();
    }

    int somarLista() {
        int count = 0;
        for (Integer n : lista) {
            count += n;
        }
        return count;
    }

    double mediaLista() {
        return ((double) somarLista()) / lista.size();
    }

}