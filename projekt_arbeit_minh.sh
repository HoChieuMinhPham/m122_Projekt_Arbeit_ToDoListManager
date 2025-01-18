#!/bin/bash

todo_file="todos.txt"
declare -a status_list=(
    "is starting"
    "in process"
    "finished"
    )



if_input_is_valid_add_task(){
    # Here it will proof if the input from method 'add task' is valid
    # This is only for clean codes. To make the codes easier to read and understand.
    # It proofs only if something is written, it will not check if the Time is a time.
    #
    # arguments
    # $1 - task
    # $2 - Deadline of the task
    # return codes:
    # 0 - input (Task and Time is written) is valid
    # 1 - Nothing was written in Task and Time
    # 2 - Task is written but Time is empty
    # 3 - Time is written but Task is empty

    local task=$1
    local deadline=$2

    if [[ -z "$task" ]] && [[ -z "$deadline" ]]; then
        echo ""
        echo "Please enter a task and deadline"
        echo "Task is not added in the todo file"
        echo ""
        return 1
    elif [[ -n "$task" ]] && [[ -z "$deadline" ]]; then
        echo ""
        echo "Please enter the deadline"
        echo "Task is not added in the todo file"
        echo ""
        return 2
    elif [[ -z "$task" ]] && [[ -n "$deadline" ]]; then
        echo ""
        echo "Please enter the task"
        echo "Task is not added in the todo file"
        echo ""
        return 3
    else
        return 0
    fi
}

if_input_is_number(){
    # proofs if the argument you entered is a number
    # Arguments:
    # $1 - Input to proof if it's a number
    # Return Code:
    # 0 - Input is a number
    # 1 - Input is not a number

    local input=$1

    if (( input + 0 )) 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

if_input_is_greater_than_amount_of_tasks(){
    # proofs if input for selecting task is greater than amount of tasks in file
    #
    # arguments
    # $1 - todo file txt
    # $2 - todo number -> input
    #
    # return codes
    # 0 - input is greater than amount of tasks.
    # 1 - input is equal to a number of the amount of tasks.

    local todo_file=$1
    local todo_number=$2
    local amount_of_task_in_file=0

    while read -r line; do
        ((amount_of_task_in_file++))
    done < "$todo_file"

    if [[ "$todo_number" -gt "$amount_of_task_in_file" ]]; then
        return 0
    else
        return 1
    fi
}




show_todos() {
    # this method will print out what tasks are in the file 'todos.txt'.
    # if the file exist but has no tasks, then it will return an error.
    # if the file doesn't exist then it will also return an error.
    #
    # arguments
    # $1 - todo file (list of tasks)
    #
    # return codes
    # 0 - file exists and has tasks in the file -> prints out tasks as a list
    # 1 - file exists, but has no tasks in the file -> nothing is written in the file
    # 2 - file doesn't exist


    local todo_file=$1


    if [ -f "$todo_file" ] && [ ! -s "$todo_file" ]; then
        echo ""
        echo "You have written no Task in file ${todo_file}"
        echo ""
        return 1
    elif [[ -f "$todo_file" ]]; then

        echo ""
        local counter=0
        while read -r line; do
            ((counter++))
            echo "$counter: $line"
        done < "$todo_file"
        echo ""

        return 0
    else
        echo ""
        echo "No tasks found."
        echo ""
        return 2
    fi
}

add_task() {
    #
    # this function will ask you what the task is and what the Deadline of the task is.
    # When input is proven sucessfull, it will be put in a file and get the status -> is starting
    #
    # arguments
    # $1 - todo file 'todo.txt'
    # $2 - status Array List
    #
    # return codes
    # 0 - task is successfully added in the todo file 'todo.txt'
    # 1 - input in invalid -> task is not added into the file



    local todo_file=$1
    shift
    local status_list=("$@")

    echo ""
    read -p "Enter Task Name: " task
    read -p "Enter Deadline: " deadline


    if if_input_is_valid_add_task $task $deadline; then
        echo ""
        echo "${deadline}: ${task}, Status: ${status_list[0]}" >> "$todo_file"
        echo "Task (${task}) added successfully."
        return 0
    else
        return 1
    fi
}



update_status() {
    # this function will change the status from a task and will overwrite the task's status
    # it will ask which task in the file will be edited
    # then it will ask which status you want to overwrite in the file
    #
    # arguments
    # $1 - todo txt file
    # $2 - status list
    #
    # return code
    # 0 - updates/ overwrite the status from task successfully
    # 1 - there are no task in the file
    # 2 - input for task is not a number
    # 3 - input is greater than amount of tasks in the file
    # 4 - input for status is not a number
    # 5 - input is greater or less than amount of statuses in list

    local todo_file=$1
    shift
    local status_list=("$@")
    local counter=0

    if show_todos "$todo_file"; then

        read -p "Choose the ToDo number to update: " todo_number

        if if_input_is_number $todo_number; then
            if if_input_is_greater_than_amount_of_tasks "$todo_file" $todo_number; then
                echo ""
                echo "Invalid input -> the number is not contained in the list. Please try again."
                echo ""
                return 3
            fi
        else
            echo ""
            echo "Invalid input. Must contain a number. Please try again."
            echo ""
            return 2
        fi

        echo "Available statuses:"
        for status in "${status_list[@]}"; do
            counter=$((counter + 1))
            echo "$counter: $status"
        done

        read -p "Choose the status number: " status_number

        if if_input_is_number $status_number; then
            if [[ "$status_number" -lt 1 || "$status_number" -gt ${#status_list[@]} ]]; then
                echo ""
                echo "Invalid status number -> the number is not contained in the list. Please try again."
                echo ""
                return 5
            fi
        else
            echo ""
            echo "Invalid status number. Input must be a number. Please try again."
            echo ""
            return 4
        fi
        new_status="${status_list[$((status_number - 1))]}"

        line_number=$((todo_number))


        # it will
        sed -i "${line_number}s/Status: .*/Status: ${new_status}/" "$todo_file"

        echo ""
        echo "Task updated to '${new_status}'."
        echo ""
        return 0
    else
        echo ""
        return 1
    fi
}






main_application(){
    #
    #this Method is the main application of this bashScript.
    #It will ask the user what he wants to do:
    #Command Words:
    #Show Tasks as a File
    #Add {task} -> adds task, deadline and status in file 'todo.txt' statuses (is starting, in process, finished)
    #Update{task} -> updates status from a task that is in the file 'todo.txt'
    #Exit -> exits the programm and returns 0
    #
    #arguments
    # $1 - todo file
    # $2 - status Array List
    #
    #return Codes
    #0 = Main Application is done

    local todo_file=$1
    shift
    local status_list=("$@")

    while true; do
        echo "1. Show To Do List"
        echo "2. Add a New Task"
        echo "3. Update Task Status"
        echo "4. Exit"
        echo ""
        read -p "Choose an option: " option

        case $option in
        1) show_todos "$todo_file";;
        2) add_task "$todo_file" "${status_list[@]}";;
        3) update_status "$todo_file" "${status_list[@]}";;
        4) exit 0;;
        *)
            echo ""
            echo "invalid option, choose a valid option"
            echo ""
        ;;
        esac
    done

}

main_application "$todo_file" "${status_list[@]}"




