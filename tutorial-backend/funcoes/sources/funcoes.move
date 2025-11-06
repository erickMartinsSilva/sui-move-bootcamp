/*
    Funções são blocos de código reutilizáveis que realizam uma determinada ação.

    Funções são chamadas por meio de transações do usuário ou por meio de outras funções.

    Por padrão, funções são privadas e só podem ser acessadas dentro do módulo em que foram declaradas.
*/

module funcoes::test_funcoes {
    use std::debug::print;
    use std::string::utf8;

    fun retorno(): u64 {
        let a = 1;
        a
    }

    fun retorno_condicional(a: u64): bool {
        a > 0 // retorna true se a > 0, false se não for
    }

    // public: modificador de acesso que permite com que uma função possa ser chamada fora de seu escopo de declaração
    public fun funcao_publica() {
        print(&utf8(b"Ola de test_funcoes!"));
    }

    #[test]
    fun test() {
        retorno();
        let a = retorno_condicional(0);
        print(&a); // saída esperada: [debug] false
    }
}

module funcoes::test_funcoes2 {
    use std::debug::print;
    use funcoes::test_funcoes::{Self, funcao_publica};

    fun chamada_externa() {
        // existem três formas de chamar funções públicas:
        funcoes::test_funcoes::funcao_publica(); // quando não importamos o módulo com use
        test_funcoes::funcao_publica(); // quando importamos o Self
        funcao_publica(); // quando importamos a função diretamente
    }

    #[test]
    fun test() {
        chamada_externa();
    }
}

module funcoes::test_funcoes3 {
    use std::debug::print;

    // uma função pode receber parâmetros. cada um deve ter tipo explícito e ser separado por vírgula.
    fun parametros(a: u64, b: bool) {
        print(&a);
        print(&b);
    }

    // uma função pode ter mais de um tipo de retorno.
    fun retorno_multiplo(): (vector<u8>, u64) {
        (b"Sui", 0)
    }

    fun retorno_explicito(): u64 {
        return 100 // não precisamos retornar explicitamente, mas podemos.
    }

    #[test_only]
    use std::string::utf8;

    #[test]
    fun test() {
        parametros(10, false);
        let (nome, numero) = retorno_multiplo();
        print(&utf8(nome));
        print(&numero);
        let num = retorno_explicito();
        print(&num);
    }
}

module funcoes::test_funcoes4 {
    // entry: função equivalente à main em outras linguagens, podemos chamá-las do terminal no momento de subir o código para a blockchain
    // podem ser chamadas de forma segura e invocadas diretamente
    // não é um modificador restritivo (pode ser chamada por outras funções) e não retornam nada
    public entry fun funcao_main() {
        funcoes::test_funcoes::funcao_publica();
    }

    // funções de leitura
    #[ext(view)]
    public fun funcao_leitura(): u16 {
        200
    }

    #[test_only]
    use std::debug::print;

    #[test]
    fun test() {
        funcao_main();
        let a = funcao_leitura();
        print(&a);
    }
}