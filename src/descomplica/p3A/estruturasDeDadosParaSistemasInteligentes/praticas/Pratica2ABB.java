package descomplica.p3A.estruturasDeDadosParaSistemasInteligentes.praticas;

import javax.swing.JOptionPane;

public class Pratica2ABB {

    /*
     * Algoritmo teste
     * 
     * início_algoritmo
     * Declarar
     * num numérico_inteiro;
     * 
     * ArvoreBinaria arv ← novo ArvoreBinaria();
     * ler(num);
     * arv.inserirNo(num);
     * ler(num);
     * arv.inserirNo(num);
     * ler(num);
     * arv.inserirNo(num);
     * ler(num);
     * arv.inserirNo(num);
     * ler(num);
     * arv.inserirNo(num);
     * arv.exibirNo();
     * Fim_algoritmo.
     */

    public static void main(String args[]) {
        ArvoreBinaria arv = new ArvoreBinaria();
        arv.inserirNo(Integer.parseInt(JOptionPane.showInputDialog("Digite o 1º número inteiro")));
        arv.inserirNo(Integer.parseInt(JOptionPane.showInputDialog("Digite o 2º número inteiro")));
        arv.inserirNo(Integer.parseInt(JOptionPane.showInputDialog("Digite o 3º número inteiro")));
        arv.inserirNo(Integer.parseInt(JOptionPane.showInputDialog("Digite o 4º número inteiro")));
        arv.inserirNo(Integer.parseInt(JOptionPane.showInputDialog("Digite o 5º número inteiro")));
        arv.exibirNo();
        System.exit(0);
    }

}

/*
 * Algoritmo BIntNo
 * 
 * início_algoritmo
 * // definição do tipo registro BIntNo com os campos abaixo
 * tipo BIntNo = registro // o tipo registro chama-se BIntNo
 * valor numérico_inteiro; // campos inteiros
 * esq, dir BIntNo; // campo vetor de capacidade
 * fimregistro;
 * Fim_algoritmo.
 */

class BIntNo {
    private int valor;
    private BIntNo esq, dir;

    BIntNo(int novoValor) {
        this.valor = novoValor;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public BIntNo getEsq() {
        return esq;
    }

    public void setEsq(BIntNo esq) {
        this.esq = esq;
    }

    public BIntNo getDir() {
        return dir;
    }

    public void setDir(BIntNo dir) {
        this.dir = dir;
    }

}

/*
 * Algoritmo ArvoreBinaria
 * 
 * início_algoritmo
 * Declarar
 * Raiz BIntNo;
 */

class ArvoreBinaria {
    private BIntNo raiz;

    public BIntNo getRaiz() {
        return raiz;
    }

    public void setRaiz(BIntNo raiz) {
        this.raiz = raiz;
    }

    /*
     * BIntNo inserir (arvore BIntNo, novoNo numérico_inteiro)
     * 
     * início_módulo
     * se (arvore = nulo)
     * então
     * retornar novo BIntNo (novoNo);
     * senão
     * se (novoNo < arvore.valor)
     * então
     * arvore.esq ← inserir (arvore.esq, novoNo);
     * senão
     * arvore.dir ← inserir (arvore.dir, novoNo);
     * fimse;
     * fimse;
     * retornar arvore;
     * fim_módulo;
     */

    private BIntNo inserir(BIntNo arvore, int novoNo) {
        if (arvore == null) {
            return new BIntNo(novoNo);
        } else {
            if (novoNo < arvore.getValor()) {
                arvore.setEsq(inserir(arvore.getEsq(), novoNo));
            } else {
                arvore.setDir(inserir(arvore.getDir(), novoNo));
            }
        }
        return arvore;
    }

    /*
     * inserirNo (novoValor numérico_inteiro)
     * 
     * início_módulo
     * Raiz ← inserir(Raiz, novoValor);
     * fim_módulo;
     */

    public void inserirNo(int novoValor) {
        raiz = inserir(raiz, novoValor);
    }

    /*
     * exibirEsquerdo (arv BIntNo)
     * 
     * início_módulo
     * se (arv <> nulo)
     * então
     * exibirEsquerdo (arv.esq);
     * escrever(arv.valor);
     * fimse;
     * fim_módulo;
     */

    private void exibirEsquerdo(BIntNo arv) {
        if (arv != null) {
            exibirEsquerdo(arv.getEsq());
            System.out.println(arv.getValor());
        }
    }

    /*
     * exibirNoEsq()
     * 
     * início_módulo
     * exibirEsquerdo(Raiz);
     * fim_módulo;
     */

    public void exibirNoEsq() {
        exibirEsquerdo(raiz);
    }

    /*
     * exibirDireito (arv BIntNo)
     * 
     * início_módulo
     * se (arv <> nulo)
     * então
     * exibirDireito(arv.dir);
     * escrever (arv.valor);
     * fimse;
     * fim_módulo;
     */

    private void exibirDireito(BIntNo arv) {
        if (arv != null) {
            exibirDireito(arv.getDir());
            System.out.println(arv.getValor());
        }
    }

    /*
     * exibirNoDir()
     * 
     * início_módulo
     * exibirDireito(Raiz);
     * fim_módulo;
     */

    public void exibirNoDir() {
        exibirDireito(raiz);
    }

    /*
     * exibirNo()
     * 
     * início_módulo
     * exibirNoEsq( );
     * exibirRaiz( );
     * exibirNoDir( );
     * fim_módulo;
     */

    public void exibirNo() {
        exibirNoEsq();
        exibirRaiz();
        exibirNoDir();
    }

    /*
     * exibirRaiz()
     * 
     * início_módulo
     * escrever("raiz " , Raiz.valor);
     * fim_módulo;
     */

    public void exibirRaiz() {
        System.out.println("raiz " + raiz.getValor());
    }

    /*
     * No (item numérico_inteiro)
     * 
     * início_módulo
     * tempNo, pai, filho, temp BIntNo;
     * tempNo ← Raiz;
     * pai ← null;
     * filho ← Raiz;
     */

    public void no(int item) {
        BIntNo tempNo, pai, filho, temp;
        tempNo = raiz;
        pai = null;
        filho = raiz;

        /*
         * enquanto (tempNo <> nulo e tempNo.valor <> item) faça
         * pai ← tempNo;
         * se (item < tempNo.valor)
         * então
         * tempNo ← tempNo.esq;
         * senão
         * tempNo ← tempNo.dir;
         * fimse;
         */

        while (tempNo != null && tempNo.getValor() != item) {
            if (item < tempNo.getValor()) {
                tempNo = tempNo.getEsq();
            } else {
                tempNo = tempNo.getDir();
            }

            /*
             * se (tempNo = nulo)
             * então
             * escrever(“item não localizado!”);
             * fimse;
             */

            if (tempNo == null) {
                System.out.println("item não localizado!");
            }

            /*
             * se (pai = nulo)
             * então
             */

            if (pai == null) {

                /*
                 * se (tempNo.dir = nulo)
                 * então
                 * Raiz ← tempNo.esq;
                 * senão
                 * se (tempNo.esq = nulo)
                 * então
                 * Raiz ← tempNo.dir;
                 * senão
                 */

                if (tempNo.getDir() == null) {
                    raiz = tempNo.getEsq();
                } else if (tempNo.getEsq() == null) {
                    raiz = tempNo.getDir();
                } else {

                    /*
                     * para temp ← tempNo e filho ← tempNo.esq
                     * até filho.dir <> null
                     * passo temp ← filho e filho ← filho.dir
                     * fimpara;
                     */

                    for (temp = tempNo, filho = tempNo.getEsq(); filho.getDir() != null; temp = filho, filho = filho.getDir());

                    /*
                     * se (filho <> tempNo.esq)
                     * então
                     * temp.dir ← filho.esq;
                     * filho.esq ← Raiz.esq;
                     * fimse;
                     */

                    if (filho != tempNo.getEsq()) {
                        temp.setDir(filho.getEsq());
                        filho.setEsq(raiz.getEsq());
                    }

                    /*
                     * filho.dir ← Raiz.dir;
                     * Raiz ← filho;
                     * fimse;
                     */

                    filho.setDir(raiz.getDir());
                    raiz = filho;
                }

                /*
                 * fimse;
                 * senão
                 * se (tempNo.dir = nulo)
                 * então
                 */

            } else if (tempNo.getDir() == null) {

                /*
                 * se (pai.esq = tempNo)
                 * então
                 * pai.esq ← tempNo.esq;
                 * senão
                 * pai.dir ← tempNo.esq;
                 * fimse;
                 */

                if (pai.getEsq() == tempNo) {
                    pai.setEsq(tempNo.getEsq());
                } else {
                    pai.setDir(tempNo.getEsq());
                }

                /*
                 * senão
                 * se (tempNo = nulo)
                 * então
                 */

            } else if (tempNo == null) {

                /*
                 * se (pai.esq = tempNo)
                 * então
                 * pai.esq ← tempNo.dir;
                 * senão
                 * pai.dir ← tempNo.dir;
                 * fimse;
                 */

                if (pai.getEsq() == tempNo) {
                    pai.setEsq(tempNo.getDir());
                } else {
                    pai.setDir(tempNo.getDir());
                }

                /*
                 * senão
                 * para temp ← tempNo e filho ← tempNo.esq
                 * até filho.dir <> nulo
                 * passo temp ← filho e filho ← filho.dir
                 * fimpara;
                 */

            } else {
                for (temp = tempNo, filho = tempNo.getEsq(); filho != null; temp = filho, filho = filho.getDir());

                /*
                 * se (filho <> tempNo.esq)
                 * então
                 * temp.dir ← filho.esq;
                 * filho.esq ← tempNo.esq;
                 * fimse;
                 */

                if (filho != tempNo.getEsq()) {
                    temp.setDir(filho.getEsq());
                    filho.setEsq(tempNo.getEsq());
                }

                /*
                 * filho.dir ← tempNo.dir;
                 * se (pai.esq = tempNo)
                 * então
                 * pai.esq ← filho;
                 * senão
                 * pai.dir ← filho;
                 * fimse;
                 * fimse;
                 */

                filho.setDir(tempNo.getDir());
                if (pai.getEsq() == tempNo) {
                    pai.setEsq(filho);
                } else {
                    pai.setDir(filho);
                }
            }

            /*
             * fimenquanto;
             * fimmódulo;
             * fim_algoritmo.
             */

        }
    }

}
