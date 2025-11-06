module vetores::vetores {
    use std::debug::print;
    use std::vector::{empty, length, borrow, borrow_mut, push_back}; // necessário importar funções de vetor para usá-las
    
    // Vetores são formas de armazenar dados de mesmo tipo de forma dinâmica.

    fun vetores() {
        // // declaração de um vetor mutável de inteiros u8 vazio
        // let mut vetor = empty<u8>();

        // // push_back: insere um elemento no final do vetor
        // push_back(&mut vetor, 2);
        
        // length: retorna o tamanho do vetor (qtd de elementos)
        // let vetorLength = length(&vetor);
        // print(&vetorLength); // saída esperada: [debug] 1
        
        // // borrow: obtém uma referência imutável elemento no índice i de um vetor
        // let borrowedValue = borrow(&vetor, 0);
        // print(borrowedValue); // saída esperada: [debug] 2

        // // borrow_mut: obtém uma referência mutável do elemento no índice i do vetor
        // let borrowedMutableValue = borrow_mut(&mut vetor, 0);
        // print(borrowedMutableValue); // saída esperada: [debug] 2

        // *borrowedMutableValue = 3;
        // print(borrowedMutableValue); // saída esperada: [debug] 3

        // desafio: declarar matrix 3x3 e imprimir seus elementos
        let matrix = vector[
            vector[1,2,3],
            vector[4,5,6],
            vector[7,8,9]
        ];

        let mut i = 0;
        let amountLines = length(&matrix);

        while(i < amountLines) {
            let currentLine = borrow(&matrix, i);
            let currentLineLength = length(currentLine);
            let mut j = 0;
            
            while(j < currentLineLength) {
                let currentElement = borrow(currentLine, j);
                print(currentElement);
                j = j + 1;
            };
            i = i + 1;
        };
    }

    #[test]
    fun test() {
        vetores();
    }
}