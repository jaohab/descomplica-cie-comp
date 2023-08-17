package descomplica.p2A.programacaoExtrema.aulas;

public class AulaThreadEx3 {

    public static void main(String[] args) {
        MinhaThread minhaThread = new MinhaThread();
        Thread thread = new Thread(minhaThread);
        thread.start();
        System.out.println("Thread Principal");
    }
    
}

class MinhaThread implements Runnable {
    public void run() {
        System.out.println("Thread Secundária");
    }
}