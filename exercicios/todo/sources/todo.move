module todo::todo {
    use std::debug::print;
    use std::vector::{length, push_back, borrow};

    public struct Task has store {
        description: vector<u8>,
        done: bool
    }

    public struct TaskList has key, store {
        id: UID,
        items: vector<Task>
    }

    fun create_tasklist(ctx: &mut TxContext) {
        let list = TaskList {
            id: object::new(ctx),
            items: vector[]
        };

        transfer::transfer(list, tx_context::sender(ctx))
    }

    fun create_task(ctx: &mut TxContext, description: vector<u8>): Task {
        return Task {
            description,
            done: false
        }
    }

    fun get_tasks(list: &TaskList) {
        let listLength = length(&list.items);

        if(listLength > 0) {
            let mut i = 0;
            while(i < listLength) {
                let currentTask = borrow(&list.items, i);
                print(currentTask);
                i = i + 1;
            }
        }
    }

    fun get_completed_tasks(list: &TaskList) {
        let listLength = length(&list.items);

        if(listLength > 0) {
            let mut i = 0;
            while(i < listLength) {
                let currentTask = borrow(&list.items, i);
                if(currentTask.done) print(currentTask);
                i = i + 1;
            }
        }
    }

    fun get_incomplete_tasks(list: &TaskList) {
        let listLength = length(&list.items);

        if(listLength > 0) {
            let mut i = 0;
            while(i < listLength) {
                let currentTask = borrow(&list.items, i);
                if(!currentTask.done) print(currentTask);
                i = i + 1;
            }
        }
    }

    fun delete_tasklist(list: &mut TaskList) {
        let TaskList { id, items: _ } = list;
        id.delete();
    }

    fun add_task_to_list(list: &mut TaskList, task: Task) {
        list.items.push_back(task);
    }

    fun update_task(task: &mut Task, description: vector<u8>) {
        task.description = description;
    }

    fun mark_as_done(task: &mut Task) {
        task.done = true;
    }
}