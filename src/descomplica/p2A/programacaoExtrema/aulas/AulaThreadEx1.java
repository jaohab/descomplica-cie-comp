package descomplica.p2A.programacaoExtrema.aulas;

public class AulaThreadEx1 extends Thread {

    public void run() {
        System.out.println("Thread Secundária");
    }

    public static void main(String[] args) {
        AulaThreadEx1 minhaThread = new AulaThreadEx1();
        minhaThread.start();
        System.out.println("Thread Principal");
    }
    
}
