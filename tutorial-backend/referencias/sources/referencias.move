module referencias::referencias {
    use std::debug::print;

    /*
        Ao usar variáveis como parâmetros para funções, utilizamos Referências.

        Em Move, referências podem ser:
        - Mutáveis (&mut): Permitem modificações na referência por meio de uma escrita nela;
        - Imutáveis (&): Somente leitura e não podem ter seu valor modificado.
    */

    fun referencias() {
        // var2: referência imutável de var1
        let var1 = 10;
        let var2 = &var1;

        // não é necessário usar o & ao passar referências
        print(var2); // saída esperada: [debug] 10
        // *var1 = 20; <- essa atribuição é inválida pois var1 é uma referência imutável

        // para criar referências mutáveis de uma variável, declare-a como let mut
        // var4: referência mutável de var3
        let mut var3 = 20;
        let var4 = &mut var3;
        print(var4); // saída esperada: [debug] 20
        *var4 = 30;
        print(var4); // saída esperada: [debug] 30
    }

    #[test]
    fun test() {
        referencias();
    }
}


