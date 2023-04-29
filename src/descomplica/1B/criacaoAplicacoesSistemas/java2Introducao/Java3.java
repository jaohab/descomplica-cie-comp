package descomplica.periodo1.criacaoAplicacoesSistemas.java2Introducao;

public class Java3 {
    
    public static void main (String entrada[]) {
        //variáveis
        int numInt;
        double numReal, soma;
        char caracter;
  
        //entrada de dados
        //numInt = Integer.parseInt(entrada[0]);
        numInt = 54;
        //numReal = Double.parseDouble(entrada[1]);
        numReal = 9;
        //caracter = (entrada[2]).charAt(0);
        caracter = '+';
  
        //processamento
        soma = (double)numInt + numReal;
      
        //saida de resultados
        System.out.println((double)numInt + " + " + numReal + " = " + soma + " sinal " + caracter);
  
        System.exit(0);
  
    }
    
}