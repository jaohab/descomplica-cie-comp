var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];


// Modo 1 - inline
var resultado = numeros.filter(item => item % 2 === 0);
console.log(resultado);


// Modo 2 - função interna
var numerosFiltrados = numeros.filter(
    function (item) {
        return item > 5;
    }
)
console.log(numerosFiltrados);


// Modo 3 - função externa
function buscarValores(item) {
    return item < 5;
}
var numerosEncontrados = numeros.filter(buscarValores);
console.log(numerosEncontrados);


// Modo 4 - função anonima
var r1 = numeros.filter((item) => {
    return item > 5;
});
console.log(r1);


// Simplificação (inline)
var r2 = numeros.filter(item => item > 5);
console.log(r2);



var funcionario = [
    { nome: "Luiz", idade: 62 },
    { nome: "Davi", idade: 22 },
    { nome: "Artur", idade: 18 },
    { nome: "Lucas", idade: 40 }
]

var pessoasListagem1 = funcionario.filter(valor => console.log(valor.nome));
var pessoasListagem2 = funcionario.filter(valor => console.log(valor.nome.length < 5));