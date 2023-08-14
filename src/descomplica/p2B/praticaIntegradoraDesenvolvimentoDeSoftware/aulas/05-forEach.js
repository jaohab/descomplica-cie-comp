var numeros = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

for(let valor of numeros) {
    console.log(valor);
}

numeros.forEach(valor => console.log(valor));

var tot = 0;
numeros.forEach(valor => {
    tot += valor;
})
console.log(tot);





numeros.forEach(function(valor, indice, array){
    console.log(array[indice]);
})