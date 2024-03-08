package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.aulas;

public class QuickSort {

    public static void quickSort(int p, int q, int vetor[]) {
        int x;
        if (p < q) {
            x = particao(p, q, vetor);
            quickSort(p, x - 1, vetor);
            quickSort(x + 1, q, vetor);
        }
    }

    public static int particao(int p, int q, int vetor[]) {
        int j = p - 1;
        int temp, aux = vetor[q];
        for (int i = p; i <= q; i++) {
            if (vetor[i] <= aux) {
                j++;
                temp = vetor[i];
                vetor[i] = vetor[j];
                vetor[j] = temp;
            }
        }
        return j;
    }

    public static void main(String[] args) {
        int vet[] = { 12, 5, -3, 4, 0, 21, 8, -7, 9, 6 };
        quickSort(0, 9, vet);
        for (int n : vet) {
            System.out.print(n + " ");
        }
    }

}
