package descomplica.p2A.programacaoExtrema.aulas;

public class AulaThreadEx5 {

    // Com sincronização

    public static void main(String[] args) {
        ListaNumeros listaNumeros = new ListaNumeros();

        ThreadEstendida1 minhaThread_1 = new ThreadEstendida1(listaNumeros);
        ThreadEstendida2 minhaThread_2 = new ThreadEstendida2(listaNumeros);

        minhaThread_1.start();
        minhaThread_2.start();
    }
    
}

class ListaNumeros {
    synchronized void printTable(int n) {
        for (int i = 1; i <= 4; i++) {
            System.out.println(n + i);
            try {
                Thread.sleep(1000);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
}

class ThreadEstendida1 extends Thread {
    ListaNumeros listaNumeros;

    ThreadEstendida1(ListaNumeros listaNumeros) {
        this.listaNumeros = listaNumeros;
    }

    public void run() {
        listaNumeros.printTable(10);
    }
}

class ThreadEstendida2 extends Thread {
    ListaNumeros listaNumeros;

    ThreadEstendida2(ListaNumeros listaNumeros) {
        this.listaNumeros = listaNumeros;
    }

    public void run() {
        listaNumeros.printTable(1000);
    }
}