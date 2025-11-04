module tipos_primitivos::tipos_primitivos {
    use std::debug::print;
    
    // === TIPOS DE DADOS ===
    //     Dados em Move podem assumir os seguintes tipos:
        
    //     - u: valores inteiros positivos, onde o número após o u determina a quantidade
    //       de números possíveis que aquela variável pode exibir
    //         - tipos possíveis: u8, u16, u32, u64, u128, u256;
    //         - exemplo: u8 pode exibir todos os números de o até 2⁸-1.
    //     - vector<T>: conjunto de valores de um determinado tipo T
    //         - amplamente utilizado para representar strings (vector<u8>).
    //     - bool: valores booleanos (true, false);
    //     - address: endereços (ou contas) no armazenamento global
    //     - signer: tipo de recurso que permite com que uma ação seja feita no nome de um endereço

    fun tiposPrimitivos() {

    }

    #[test]
    fun test() {
        tiposPrimitivos();
    }
}

