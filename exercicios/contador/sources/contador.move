module contador::contador {
    public struct Counter has drop {
        current: u64,
        target: u64
    }

    // código de erro para overflow
    const ERROR_COUNTER_OVERFLOW: u64 = 1;

    // new_counter: cria um novo contador com base num alvo
    fun new_counter(target: u64): Counter {
        return Counter { current: 0, target }
    }

    // increment: adiciona 1 ao contador passado por parâmetro
    fun increment(counter: &mut Counter) {
        // verificação que impede incremento em caso de overflow 
        assert!(counter.current < counter.target, ERROR_COUNTER_OVERFLOW);
        counter.current = counter.current + 1;
    }
    
    // reset: define o valor atual como 0, reiniciando o contador
    fun reset(counter: &mut Counter) {
        counter.current = 0;
    }

    #[test_only]
    use std::debug::print;

    #[test]
    fun test() {
        // criação de um contador com alvo 3
        let mut counter = new_counter(3);
        let counter_mut_ref = &mut counter;

        increment(counter_mut_ref);
        print(&counter_mut_ref.current);
        increment(counter_mut_ref);
        print(&counter_mut_ref.current);
        increment(counter_mut_ref);
        print(&counter_mut_ref.current);
        // increment(&mut counter); // erro previsto para essa função, já que o valor atual é igual ao alvo (3)

        reset(counter_mut_ref);
        print(&counter_mut_ref.current);
    }
}


