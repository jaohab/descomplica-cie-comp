package descomplica.p2A.programacaoExtrema.aulas;

public class AulaThreadEx2 {

    public static void main(String[] args) {
        MinhaThread minhaThread = new MinhaThread();
        minhaThread.start();
        System.out.println("Thread Principal");
    }
    
}

class MinhaThread extends Thread {
    public void run() {
        System.out.println("Thread Secundária");
    }
}