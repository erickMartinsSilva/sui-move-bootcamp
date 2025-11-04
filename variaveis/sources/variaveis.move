module variaveis::variaveis {
    use std::debug::print;
    use std::string::utf8;

    /*
        === VARIÁVEIS ===
        Existem duas formas de declarar variáveis em Move:
        
        - Locais:
            - Conteúdo mutável;
            - Declaradas com let;
            - Não precisam ter tipo definido no momento da declaração;
            - Só podem ter seu tipo alterado por meio de redeclaração (ou shadowing);
            - Escopo local: só podem ser acessadas no escopo em que foram declaradas;
            - Sobrepõe o valor de qualquer variável local anterior de mesmo nome.
        - Constantes:
            - Conteúdo imutável;
            - Declaradas com const;
            - Por convenção, constantes devem iniciar com letra maiúscula;
            - Precisam ter tipo definido no momento da declaração;
            - Escopo global: podem ser acessadas em qualquer escopo do módulo;
            - Usada para dar nome a valores estáticos em módulos.


        === TIPOS DE DADOS ===
        Dados em Move podem assumir os seguintes tipos:
        
        - u: valores inteiros positivos, onde o número após o u determina a quantidade
          de números possíveis que aquela variável pode exibir
            - tipos possíveis: u8, u16, u32, u64, u128, u256;
            - exemplo: u8 pode exibir todos os números de o até 2⁸-1.
        - vector<T>: conjunto de valores de um determinado tipo T
            - amplamente utilizado para representar strings (vector<u8>).
        - bool: valores booleanos (true, false);
        - address: endereços (ou contas) no armazenamento global
        - signer: tipo de recurso que permite com que uma ação seja feita no nome de um endereço
    */
    // variáveis constantes e com escopo global
    const VALOR: u64 = 10;
    const SAUDACAO: vector<u8> = b"Hello, world!";

    fun variaveis() {
        
        // variáveis locais com escopo de bloco
        let variavel = VALOR;
        let saudacao = SAUDACAO;
        let teste = b"Ola!";

        print(&variavel);
        print(&utf8(saudacao));
        print(&utf8(teste));
    }

    #[test]
    fun test() {
        variaveis();
    }
}




