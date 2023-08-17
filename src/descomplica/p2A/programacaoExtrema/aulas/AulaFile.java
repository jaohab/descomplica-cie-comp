package descomplica.p2A.programacaoExtrema.aulas;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;

public class AulaFile {

    public static void main(String[] args) throws IOException, ClassNotFoundException {

        // 1 - Validação
        System.out.println("> Validação\n");

        String path = "E:\\_Estudos\\_DEV\\VS Studio\\descomplica-cie-comp\\src\\descomplica\\p2A\\programacaoExtrema\\aulas\\teste.txt";

        File objFile = new File(path);
        if (objFile.exists()) {
            if (objFile.isFile()) {
                System.out.println("Nome do arquivo: " + objFile.getName());
                System.out.println("Tamanho do arquivo: " + objFile.length());
            }
        } else {
            System.out.println("Arquivo inexistente");
        }

        // 2 - Gravação
        System.out.println("\n\n> Gravação\n");

        String matricula = "0135x548";
        String nome = "Nome do Aluno";
        double teste = 9.;
        double prova = 8.5;
        int faltas = 2;

        // Teste 1 - FileWriter
        FileWriter arq1 = new FileWriter("src/descomplica/p2A/programacaoExtrema/aulas/teste_gravacao_1.txt");
        PrintWriter gravarArq1 = new PrintWriter(arq1);

        gravarArq1.println(matricula);
        gravarArq1.println(nome);
        gravarArq1.println(teste);
        gravarArq1.println(prova);
        gravarArq1.println(faltas);

        arq1.close();

        // Teste 2 - FileOutputStream
        FileOutputStream arq2 = new FileOutputStream(
                "src/descomplica/p2A/programacaoExtrema/aulas/teste_gravacao_2.txt");
        DataOutputStream gravarArq2 = new DataOutputStream(arq2);

        gravarArq2.writeUTF(matricula);
        gravarArq2.writeUTF(nome);
        gravarArq2.writeDouble(teste);
        gravarArq2.writeDouble(prova);
        gravarArq2.writeInt(faltas);

        arq2.close();

        System.out.println("Gravação efetuada com sucesso.");

        // 3 - Leitura
        // Leitura 1

        System.out.println("\n\n> Leitura - 1\n");
        System.out.println("Conteúdo do arquivo: ");
        try {
            FileReader doc1 = new FileReader(path);
            BufferedReader lerDoc1 = new BufferedReader(doc1);

            String linha = lerDoc1.readLine(); // lê a primeira linha
            while (linha != null) {
                System.out.println(linha);
                linha = lerDoc1.readLine(); // lê as próximas linha até o final.
            }

            lerDoc1.close();
        } catch (Exception e) {
            System.out.printf("Erro na abertura do arquivo: %s. \n", e.getMessage());
        }

        // Leitura 2

        System.out.println("\n\n> Leitura - 2\n");
        System.out.println("Conteúdo do arquivo: ");
        try {
            FileReader doc2 = new FileReader("src/descomplica/p2A/programacaoExtrema/aulas/teste_gravacao_1.txt");
            BufferedReader lerDoc2 = new BufferedReader(doc2);

            String linha = lerDoc2.readLine(); // lê a primeira linha
            while (linha != null) {
                System.out.println(linha);
                linha = lerDoc2.readLine(); // lê as próximas linha até o final.
            }

            lerDoc2.close();
        } catch (Exception e) {
            System.out.printf("Erro na abertura do arquivo: %s. \n", e.getMessage());
        }

        // Leitura 3

        System.out.println("\n\n> Leitura - 3\n");
        System.out.println("Conteúdo do arquivo: ");

        String getMatricula, getNome;
        double getTeste, getProva;
        int getFaltas;

        FileInputStream doc3 = new FileInputStream("src/descomplica/p2A/programacaoExtrema/aulas/teste_gravacao_2.txt");
        DataInputStream lerDoc3 = new DataInputStream(doc3);

        getMatricula = lerDoc3.readUTF();
        getNome = lerDoc3.readUTF();
        getTeste = lerDoc3.readDouble();
        getProva = lerDoc3.readDouble();
        getFaltas = lerDoc3.readInt();

        System.out.println("Matricula: " + getMatricula);
        System.out.println("Nome: " + getNome);
        System.out.println("Teste: " + getTeste);
        System.out.println("Prova: " + getProva);
        System.out.println("Faltas: " + getFaltas);

        lerDoc3.close();

        // 4 - Serialização
        System.out.println("\n\n> Serialização\n");

        Aluno a1 = new Aluno("Nome 1", 2, 10);
        Aluno a2 = new Aluno("Nome 2", 3, 8);

        // Gravar objeto
        FileOutputStream f = new FileOutputStream(new File("src/descomplica/p2A/programacaoExtrema/aulas/objTeste.txt"));
        ObjectOutputStream o = new ObjectOutputStream(f);

        o.writeObject(a1);
        o.writeObject(a2);

        o.close();
        f.close();

        // Ler objeto
        FileInputStream fi = new FileInputStream(new File("src/descomplica/p2A/programacaoExtrema/aulas/objTeste.txt"));
        ObjectInputStream oi = new ObjectInputStream(fi);

        Aluno pr1 = (Aluno) oi.readObject();
        Aluno pr2 = (Aluno) oi.readObject();

        System.out.println(pr1);
        System.out.println(pr2);

        oi.close();
        fi.close();

    }

}

class Aluno implements Serializable {

    private static final long serialVersionUID = 1L;
    private String nome;
    private int faltas;
    private double nota;

    Aluno() {
    }

    Aluno(String nome, int faltas, double nota) {
        this.nome = nome;
        this.faltas = faltas;
        this.nota = nota;
    }

    @Override
    public String toString() {
        return "Aluno: nome = " + nome + ", faltas = " + faltas + ", nota = " + nota;
    }

}
