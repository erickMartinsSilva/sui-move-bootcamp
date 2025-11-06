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




