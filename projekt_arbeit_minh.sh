#!/bin/bash

command=$1
task=$2
TODO_FILE="todos.txt"

show_todos() {
    if [[ -f "$TODO_FILE" ]]; then
        echo ""
        echo "Your ToDo List:"
        cat "$TODO_FILE"
        echo ""
    else
        echo ""
        echo "No tasks found."
        echo ""
    fi
}

add_task() {
    echo ""
    read -p "Enter Task Name: " name
    read -p "Enter Deadline: " zeit

    if [[ -z "${}"]]
    echo "${zeit}: ${name}" >> "$TODO_FILE"
    echo "Task (${name}) added successfully."
}

update_status() {
    show_todos

}




main_application(){
    #this Method is the main application of this bashScript.
    #It will ask the user what he wants to do:
    #Command Words:
    #List
    #Delete {task}
    #Add {task}
    #Print
    #Exit
    #
    #Return Codes
    #0 = Main Application is done

    while true; do
        echo "1. Show To Do List"
        echo "2. Add a New Task"
        echo "3. Update Task Status"
        echo "4. Exit"
        read -p "Choose an option: " option

        case $option in
        1) show_todos ;;
        2) add_task ;;
        3) update_status ;;
        4) exit 0;;
        *)
            echo "invalid option, choose a valid option"
            echo ""
        ;;
        esac
    done

}

main_application




