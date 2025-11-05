module structs::structs {
    use std::debug::print;
    use std::string::{String, utf8};
    use std::option::{Option, some};

    /*
        Structs são estruturas de dados definidas pelo usuário que contém campos tipados.
        Os dados de uma struct podem ter qualquer tipo não referenciado e até outras structs.
    */

    // public struct Autor has drop {
    //     nome: String
    // }

    // public struct Livro has drop {
    //     titulo: String,
    //     autor: Autor,
    //     publicado: u16,
    //     tem_audiolivro: bool,
    //     edicao: Option<u16>
    // }

    public struct Pessoa has drop {
        nome: String,
        idade: u8,
        genero: String
    }

    public struct Turma has drop {
        numero: u8,
        materia: String,
        horario: String,
        professor: Pessoa,
        alunos: vector<Pessoa>
    }

    public struct Escola has drop {
        nome: String,
        endereco: String,
        turmas: vector<Turma>
    }

    fun structs() {
        // // declaração de variáveis com base nas structs que criamos
        // let autor1 = Autor {
        //     nome: utf8(b"Paulo Coelho")
        // };
        // print(&autor1);

        // let mut livro1 = Livro {
        //     titulo: utf8(b"O Alquimista"), 
        //     autor: autor1,
        //     publicado: 1988u16, 
        //     tem_audiolivro: true,
        //     edicao: some(1)
        // }; 
        // print(&livro1);

        // // desestruturando uma struct: decompor uma struct declarada em variáveis separadas
        // // definindo um campo como "campo: _" impede com que ele seja desestruturado
        // let Livro { titulo, autor: _ , publicado, tem_audiolivro, edicao:_ } = livro1;
        // print(&titulo);
        // print(&publicado);
        // print(&tem_audiolivro);
        // //print(&edicao) // essa função falharia pois não desestruturamos a edição do livro1

        // // podemos criar referências para structs
        // let mut autor1 = Autor {
        //     nome: utf8(b"George Orwell")
        // };

        // let autor1_ref = &autor1;
        // print(autor1_ref);

        // let autor1_mut_ref = &mut autor1;
        // print(autor1_mut_ref);
        // *autor1_mut_ref = Autor {
        //     nome: utf8("Franz Kafka")
        // };
        // print(autor1_mut_ref);

        // === DESAFIO ===
        let professor1 = Pessoa {
            nome: utf8(b"Renato"),
            idade: 45,
            genero: utf8(b"Masculino")
        };

        let professor2 = Pessoa {
            nome: utf8(b"Glauco"),
            idade: 32,
            genero: utf8(b"Masculino")
        };

        let aluno1 = Pessoa {
            nome: utf8(b"Erick"),
            idade: 19,
            genero: utf8(b"Masculino")
        };

        let aluno2 = Pessoa {
            nome: utf8(b"Guilherme"),
            idade: 19,
            genero: utf8(b"Masculino")
        };

        let aluno3 = Pessoa {
            nome: utf8(b"Rafael"),
            idade: 20,
            genero: utf8(b"Masculino")
        };

        let aluno4 = Pessoa {
            nome: utf8(b"Gabriel"),
            idade: 20,
            genero: utf8(b"Masculino")
        };

        let turma1 = Turma {
            numero: 1,
            materia: utf8(b"Computacao"),
            horario: utf8(b"18:00"),
            professor: professor1,
            alunos: vector[aluno1, aluno2]
        };

        let turma2 = Turma {
            numero: 2,
            materia: utf8(b"Engenharia"),
            horario: utf8(b"16:00"),
            professor: professor2,
            alunos: vector[aluno3, aluno4]
        };
    
        let escola = Escola {
            nome: utf8(b"CEFET/RJ"),
            endereco: utf8(b"Rua General Canabarro"),
            turmas: vector[turma1, turma2]
        };

        print(&escola);
    }
    
    #[test]
    fun test() {
        structs();
    }
}