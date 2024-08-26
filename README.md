# retangulo.sh
## Problema

Dada uma matriz binária 2D de tamanho MxN preenchida com '0' (zero) e '1' (um), encontre o retângulo de maior área contendo apenas '1' e retorne o valor de sua área.
Exemplo:
 
Entrada:
```
[
  ['1','0','1','0','0'],
  ['1','0','1','1','1'],
  ['1','1','1','1','1'],
  ['1','0','0','1','0']
]
```
Saída: 6

## Solução
### Elementos envolvidos
Para que se entenda a solução do problema, é preciso identificar os elementos envolvidos na abordagem, a saber:

- Sequências
Numa mesma linha, são séries compostas por 1 a n elementos do dígito "1", sem interrupção. 
- Retângulos
São conjuntos de sequências que se repetem em linhas consecutivas.

Por exemplo, na entrada fornecida acima é possível identificar na segunda linha uma sequência de 3 unidades, a qual se repete na linha reguinte, num total de duas repetições dessa sequência, o que configura um retângulo de base 3 e altura 2, resultando numa área de 6 unidades. 
Na terceira linha temos também a sequencia de 5 unidades, porém ela não se repete nas linhas vizinhas, resultando num retângulo de altura 1 e base 5, totalizando 5 unidades de área. Portanto, percebe-se que o retângulo descrito anteriormente possui área maior. 

# Uso
## Uso básico
```
retangulo.sh entrada.txt
```
## Prerrequisitos
- Sistema Unix-like (MacOS, Linux, etc)
- [NodeJs](https://nodejs.org/)

## Instruções
1. Baixe o script retangulo.sh
2. Cole a entrada num arquivo de texto
3. Abra o terminal e navegue até a pasta onde o script foi salvo
4. Forneça permissões de execução para o script
5. Execute o script fornecendo como argumento o arquivo de entrada

O resultada será exibido na saída. 
Por exemplo: 


# Créditos
Escrito por Arthur Grassi em agosto de 2024. 

