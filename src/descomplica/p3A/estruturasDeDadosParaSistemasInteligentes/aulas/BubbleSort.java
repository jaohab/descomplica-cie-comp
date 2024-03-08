package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.aulas;

public class BubbleSort {

    public static int[] Bubble(int nums[]) {
        final int N = nums.length;
        int aux;
        for (int i = 0; i < N - 1; i++) {
            for (int j = 0; j < N - 1 - i; j++) {
                if (nums[j] > nums[j + 1]) {
                    aux = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = aux;
                }
            }
        }
        return nums;
    }

    public static void main(String[] args) {
        int vet[] = { 9, 5, 1, 3, 10, 8, 4, 6, 7, 2 };
        vet = Bubble(vet);
        for (int n : vet) {
            System.out.print(n + " ");
        }
    }

}
