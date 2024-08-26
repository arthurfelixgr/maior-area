#! /bin/sh -

tr "'" "\"" < "$1"  > entrada.json

node <<_EOF
const entrada = require("./entrada.json");

class Sequencia {
  constructor(inicio, tamanho) {
    this.inicio = inicio;
    this.tamanho = tamanho;
  }

  equals(sequencia) {
    return (sequencia.inicio == this.inicio && sequencia.tamanho == this.tamanho);
  }
}

class Retangulo {
  constructor(base, altura) {
    this.base = base;
    this.altura = altura;
    this.area = base * altura;
  }

  equals(retangulo) {
    return this.area == retangulo.area;
  }
}

console.log("O maior retângulo tem área igual a " + achaMaiorArea(entrada) + " unidades. ");

function achaMaiorArea(entrada) {
  const sequencias = geraSequencias(entrada);
  const retangulos = geraRetangulos(sequencias);

  let maiorArea = 0;

  for (const retangulo of retangulos) {
    if (retangulo.area > maiorArea) maiorArea = retangulo.area;
  }

  return maiorArea;
}

function geraRetangulos(sequencias) {
  let retangulos = [];

  for (let i = 0; i < sequencias.length; i++) {
    for (let j = 0; j < sequencias[i].length; j++) {
      let altura = 1;

      outras_linhas:
      for (let k = i + 1; k < sequencias.length; k++) {
        for (let l = 0; l < sequencias[k].length; l++) {
          if (sequencias[k][l].equals(sequencias[i][j])) {
            altura++;
            break;
          } else {
            if (l === sequencias[k].length - 1) {
              break outras_linhas;
            }
          }
        }
      }

      retangulos.push(new Retangulo(sequencias[i][j].tamanho, altura));
    }
  }

  return retangulos;
}

function geraSequencias(entrada) {
  let sequencias = [];

  for (const linha of entrada) {
    let sequenciasLinha = [];
    
    let tamanho = 0;
    
    for (let i = 0; i < linha.length; i++) {
      if (linha[i] == 1) {
        let indice = i;
  
        while (indice < linha.length && linha[indice] == 1) {
          tamanho++;
          sequenciasLinha.push(new Sequencia(i, tamanho));
          indice++;
        }
  
        tamanho = 0;
      } 
    }
  
    sequencias.push(sequenciasLinha);
  }

  return sequencias;
}
_EOF

rm entrada.json
