module strings::strings {
    /* 
        Strings não possuem um tipo específico em Move para serem declaradas, mas existem duas formas de representá-las:
        - std::string: módulo que define tipo String e métodos para operá-lo.
        - std::ascii: módulo que define o tipo String ASCII e métodos para operá-lo.
    */
    use std::debug::print;
    use std::string::{utf8, is_empty, append, append_utf8, insert};

    fun strings() {
        // // string em bytes
        // let byteString = b"Hello, world!";
        // print(&byteString);
        // print(&utf8(byteString));

        // // string em hexadecimal
        // let hexString = x"48656C6C6F20576F726C6421";
        // print(&hexString);
        // print(&utf8(hexString));

        // let stringVazia = b"";
        // print(&is_empty(&utf8(stringVazia))); // is_empty: retorna true se a string estiver vazia, false se não estiver

        // let mut stringUtf8 = utf8(b"Ola");
        // print(&stringUtf8);
        // append_utf8(&mut stringUtf8, b", Mundo!"); // append_utf8: concatena duas strings utf8
        // print(&stringUtf8);

        // append(&mut stringUtf8, utf8(b" Eu sou o Erick!")); // append: concatena duas strings
        // print(&stringUtf8); 

        // let stringInsert = utf8(b"Insert");
        // // insert: insere uma string em outra
        // // argumentos: string destino, posição, string inserida
        // insert(&mut stringUtf8, 3, stringInsert);
        // print(&stringUtf8);


        // desafio
        let poema = utf8(b"Te vi um ponto e, flotando ante mis ojos,\nla imagen de tus ojos se quedo,\ncomo la mancha oscura orlada en fuego\nque flota y ciega si se mira al sol.");
    
        let linha1 = utf8(b"Te vi um ponto e, flotando ante mis ojos,\n");
        let linha2 = utf8(b"la imagen de tus ojos se quedo,\n");
        let linha3 = utf8(b"como la mancha oscura orlada en fuego\n");
        let linha4 = utf8(b"que flota y ciega si se mira al sol.");

        let mut poema2 = utf8(b"");
        append(&mut poema2, linha1);
        append(&mut poema2, linha2);
        append(&mut poema2, linha3);
        append(&mut poema2, linha4);

        print(&poema);
        print(&poema2);

        /* 
            Por mais que o resultado seja o mesmo, o segundo método é melhor em questão de legibilidade de código
            pois, dessa forma, fica claro o que cada linha do poema representa. Quando colocamos strings grandes como
            um poema em uma única variável, o tamanho da linha de declaração fica muito grande, o que dificulta a percepção
            de todo o seu conteúdo. Quando dividimos uma string maior em substrings e depois concatenamos ela numa única
            string maior para exibição, fica mais perceptível o que cada parte da string representa.
        */
    }

    #[test]
    fun test() {
        strings();
    }
}

