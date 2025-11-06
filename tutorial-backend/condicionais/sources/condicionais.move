module condicionais::condicionais {
    use std::debug::print;
    use std::string::utf8;
    /*
        Como boa parte das linguagens de alto nível, Move também possui estruturas condicionais:

        - If-Else:
            if (condicao) {
                <expressao1>
            } else {
                <expressao2>
            }
        - Inline If-Else: if(condicao) <expressao1> else <expressao2>
    */

    // Códigos de Erro: definir códigos de erro em constantes é uma boa prática por ser mais descritivo
    // const ERROR_CODE_1: u64 = 1;
    // const ERROR_CODE_2: u64 = 2;

    const MENOR_IDADE_ERROR_CODE: u64 = 1;

    fun condicionais() {
        // let var1 = 10;
        // let var2 = 20;

        // if(var1 > var2) {
        //     // abort: palavra reservada para abortar a execução de uma função.
        //     abort ERROR_CODE_1 // chamada com um código de erro u64
        // };

        // // assert: macro para abortar a execução de uma função com base numa condição.
        // // parâmetros: condição, código de erro u64
        // assert!(var1 == var2, ERROR_CODE_2);

        // validação com abort
        let idade = 17;
        if(idade >= 18) {
            print(&utf8(b"Acesso liberado!"));
        } else abort MENOR_IDADE_ERROR_CODE;

        // validação com assert
        assert!(idade >= 18, MENOR_IDADE_ERROR_CODE);
        print(&utf8(b"Acesso liberado!"));
    }

    #[test]
    fun test() {
        condicionais();
    }
}

