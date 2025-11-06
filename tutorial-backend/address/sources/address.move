module address::test_address {
    /*
        O address (endereço) é um identificador único de uma localização na blockchain, utilizado para identificar pacotes, objetos e contas.

        Um endereço:
        - Possui tamanho fixo de 32 bytes;
        - Normalmente prefixado por '0x';
        - Seguido por uma string hexadecimal;
        - Não é case sensitive.
        - Sintaxe difere com base no contexto de seu uso:
            - como expressão: prefixado por @;
            - fora de expressão: não precisa do prefixo @.
        - Podem ser numéricos ou nomeados:
            - numérico: sintaxe não restrita a valores codificados em hex (42, 0xBEBE e 2024 são endereços numéricos válidos)
            - nomeado:
                - permite o uso de identificadores para um endereço ao invés de seus valores numéricos
                - elementos de nível superior (fora de módulos e pacotes) ou passados como argumentos ao compilador;
                - para o compilador, usar o valor numérico de um endereço nomeado não é equivalente a usar o nomeado.
        - Interage com operações de armazenamento de objetos
            - operações take, borrow, borrow_mut e transfer.
        
    */
    use std::debug::print;
    use sui::address::{to_string, from_ascii_bytes};
    use sui::tx_context::sender;

    fun test_address() {
        let address1 = @0x1;
        let address2 = @0xBEBE;
        let address3 = @0x2024;

        print(&address1);
        print(&address2);
        print(&address3);
    }

    fun test_sender(ctx: &TxContext) {
        // sender: responsável pelo envio de uma transação (execução de uma função) na blockchain
        // acessível pela função sender com o contexto da transação passado como parâmetro
        print(&sender(ctx)); // saída esperada: [debug] @0x0

        print(&to_string(@0x1)); // saída esperada: [debug] "0000000000000000000000000000000000000000000000000000000000000001"
        print(&from_ascii_bytes(&b"000000000000000000000000000000000000000000000000000000000000BEBE")); // saída esperada: [debug] @0xbebe
    }

    #[test]
    fun test() {
        let ctx = &tx_context::dummy();

        test_address();
        test_sender(ctx);
        
    }
}