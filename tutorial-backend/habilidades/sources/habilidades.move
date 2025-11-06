module habilidades::habilidades {
    /*
        Habilidades são palavras-chave que podem ser dadas para um tipo em Move
        a fim de definir ações específicas que eles podem realizar.

        Tipos em Move podem ter quatro habilidades:
        - copy: permite com que o dado possa ser copiado;
            - cópia de valores de variáveis locais via copy;
            - cópia de referências via desreferenciação (*e).
        - drop: permite com que o dado possa ser descartado;
            - é destruído durante a execução do programa;
            - possibilidade de ignorar valores em parâmetros de função, sobrescrita etc.
        - store: permite com que o dado possa ser armazenado em outros lugares;
            - existe numa estrutura mas não necessariamente no armazenamento persistente;
            - bloqueia armazenamento na cadeia quando usada junto de key
        - key: permite com que o dado seja independente para a blockchain, com seu próprio ID e proprietário.
            - objeto deve ter habilidade key para ser gerenciado dentro da Sui;
            - objeto deve ter habilidade store para ter habilidade key.

        A maioria dos tipos primitivos tem copy, drop e store, com exceção de signer, que só tem drop.

        - bool, u8, u16, u32, u64, u128, u256, e address têm copy, drop, e store.
        - signer tem drop.
            - Não pode ser copiado e não pode ser salvo no armazenamento persistente.
        - vector<T> pode ter copy, drop e store dependendo das capacidades de T.
        - As referências imutáveis & e as referências mutáveis &mut têm ambas copy e drop.
            - Isso se refere a copiar e descartar a própria referência, não ao que elas estão referenciando.
            - As referências não podem aparecer no armazenamento persistente, pois não têm store.
        - Nenhum dos tipos primitivos tem key, o que significa que nenhum deles pode ser usado diretamente como objetos armazenáveis na cadeia.
    */
    use std::debug::print;
    use sui::object::{new, delete}; // UID: incluso por padrão
    // use sui::tx_context::TxContext; // alias não necessário, incluso por padrão

    public struct IgnoreMe has drop {
        a: u8
    }
    public struct NoDrop {
        a: u8
    }

    fun test_drop() {
        let _ignoreMe = IgnoreMe {
            a: 1
        };
        // parando aqui, daria erro pois para o compilador, essa variável não foi usada e não usamos drop para sinalizar que ela é descartável.
        let noDrop = NoDrop {
            a: 1
        };
        // para registrar um uso, devemos pelo menos desestruturá-la.
        let NoDrop { a } = noDrop;
        print(&a); // saída esperada: [debug] 1
    }

    public struct Copiavel has copy {}

    fun test_copy() {
        let a = Copiavel {};
        let b = a; // a é copiado para b
        let c = *&b; // b é copiado explicitamente para c por desreferenciação

        // parando aqui, daria erro pois para o compilador, essas variáveis não foram usadas e não usamos drop para sinalizar que são descartáveis.
        // para registrar um uso, devemos pelo menos desestruturá-las.
        let Copiavel {} = a;
        let Copiavel {} = b;
        let Copiavel {} = c;
    }

    public struct CopiavelComDrop has copy, drop {}

    fun test_copy_drop() {
        let a = CopiavelComDrop {};
        let b = a;
        let c = *&b;

        // nesse caso não dá erro pois nossa struct tem drop.
    }

    public struct Objeto has key { id: UID }

    fun test_key(ctx: &mut TxContext) { // ctx: contexto mutável da transação usado para criar id
        let objeto = Objeto {
            id: new(ctx)
        };
        // como ainda não foi consumido, aqui daria erro se parássemos.
        // dessa forma, vamos consumir desestruturando e removendo o ID:
        let Objeto { id } = objeto;
        print(&id);
        delete(id);
    }

    public struct Armazenavel has store {}
    public struct Container has key, store {
        id: UID,
        item: Armazenavel
    }

    fun test_key_store(ctx: &mut TxContext) {
        let armazenavel = Armazenavel {};
        let container = Container {
            id: new(ctx),
            item: armazenavel
        };
        // parando aqui, dá erro pela falta do drop na struct Container.
        // para isso, vamos consumir seus atributos:
        let Container { id, item } = container;
        let Armazenavel { } = item;
        delete(id);
    }

    // alias não necessário: incluso por padrão
    // #[test_only]
    // use sui::tx_context;

    #[test]
    fun test() {
        // criação de um contexto de transação fictício para testes
        let mut ctx = tx_context::dummy();

        test_drop();
        test_copy();
        test_copy_drop();
        test_key(&mut ctx);
        test_key_store(&mut ctx);
    }
}