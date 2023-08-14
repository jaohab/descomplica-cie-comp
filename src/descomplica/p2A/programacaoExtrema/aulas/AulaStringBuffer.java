package descomplica.p2A.programacaoExtrema.aulas;

public class AulaStringBuffer {

    public static void main(String[] args) {

        String nome = "Nome";
        String sobreNome = "Sobrenome";
        String nomeCompleto = nome + " " + sobreNome;
        String nomeComBuffer;

        StringBuffer buffer = new StringBuffer();
        buffer.append(nome);
        buffer.append(" ");
        buffer.append(sobreNome);

        nomeComBuffer = buffer.toString();

        System.out.println(nome + " " + sobreNome);
        System.out.println(nomeCompleto);

        //Usar o StringBuffer para ganho de performance
        System.out.println(nomeComBuffer);

        //StringBuffer e StringBuilder tem a mesma execução, com a diferença de StringBuffer ser Thread Safe 
        
    }
    
}
