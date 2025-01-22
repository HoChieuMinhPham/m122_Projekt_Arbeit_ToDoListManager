# m122_Projekt_Arbeit_ToDoListManager

Zuerst haben wir uns überlegt, welche Funktionen unser ToDo List Manager haben soll. Natürlich gibt es 2 Funktionen -> Aufgaben erstellen und Aufgaben anzeigen. Die beste Lösung wäre, Aufgaben in eine txt.file zu schreiben und den Inhalt der Datei mit dem Befehl 'cat' anzuzeigen.

Also fangen wir mit der Hauptfunktion, der Funktion show_todos und der Funktion add_task an. Die Aufgaben werden in der Datei todos.txt gespeichert. Wir waren sehr schnell fertig, so dass wir eine zusätzliche Funktion namens update_status erfanden.

![image](https://github.com/user-attachments/assets/9ff23dfe-7a76-4c8c-b178-7d553505578d)
![image](https://github.com/user-attachments/assets/45af9dc2-c6cf-4808-bee0-4e6eed3bd877)
![image](https://github.com/user-attachments/assets/aaa90326-4c86-4209-9067-7ebb60f4dd7e)



```bash
#!/bin/bash

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
    read -p "Enter Deadline: " deadline

    if [[ -z "$name" || -z "$deadline" ]]; then
        echo "Task name and deadline cannot be empty."
        return 1
    fi

    echo "${deadline}: ${name}" >> "$TODO_FILE"
    echo "Task (${name}) added successfully."
}

update_status() {
    show_todos
}

main_application() {
    while true; do
        echo "1. Show To-Do List"
        echo "2. Add a New Task"
        echo "3. Update Task Status"
        echo "4. Exit"
        read -p "Choose an option: " option

        case $option in
        1) show_todos ;;
        2) add_task ;;
        3) update_status ;;
        4) exit 0 ;;
        *)
            echo "Invalid option. Please choose a valid option."
            echo ""
            ;;
        esac
    done
}

main_application
```

## main_application

Wir haben eine einfache Abfragefunktion erstellt, die den Benutzer fragt, welche Funktion er ausführen möchte.

Wir haben auch ein Java-Projekt gemacht und uns davon inspirieren lassen. 

### java
```java
public class MainApplication {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        RunZoo zoo = new RunZoo();
        Game game = new Game();
boolean mainFunction = true;

        while (mainFunction) {
            System.out.println();
            System.out.println("1. Add an animal to the zoo");
            System.out.println("2. Display animals in the zoo");
            System.out.println("3. Animal Battle");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");
            String input = scanner.nextLine();
            int choice = 0;
            try {
                choice = Integer.parseInt(input);
            } catch (NumberFormatException e) {
                System.out.println("You must input a number!");

            }
            switch (choice) {
                case 1 -> addAnimalToZoo(scanner, zoo);
                case 2 -> zoo.displayAnimals();
                case 3 -> {
                    mainFunction = game.startGame((zoo.getAnimals()));
                }
                case 4 -> {
                    System.out.println("Exiting program.");
                    mainFunction = false;
                }
                default -> System.out.println("Invalid choice. Please try again.");
            }
        }
    }
```

### bash 
```bash
main_application() {
    while true; do
        echo "1. Show To-Do List"
        echo "2. Add a New Task"
        echo "3. Update Task Status"
        echo "4. Exit"
        read -p "Choose an option: " option

        case $option in
        1) show_todos ;;
        2) add_task ;;
        3) update_status ;;
        4) exit 0 ;;
        *)
            echo "Invalid option. Please choose a valid option."
            echo ""
            ;;
        esac
    done
}
```
Wie man sieht, sieht unsere bash main Anwendung sehr ähnlich aus.

Der switch case von Java wird hier durch eine case-Anweisung ersetzt.

Jeder Zahl ist eine Funktion zugeordnet. 

Wenn man also 1 eingibt, wird show_todos ausgeführt.

## show_todos()

```bash
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
```

Wir haben hier eine einfache If-Statement eingefügt, die prüft, ob die Datei existiert. 
```bash
[[ -f "$TODO_FILE" ]]
```
![image](https://github.com/user-attachments/assets/39bf384a-da54-4f44-a545-3ce4ff75c217)

Dieser Test prüft, ob die Datei existiert, wenn ja, wird der Inhalt der Datei ausgedruckt.
![image](https://github.com/user-attachments/assets/9b345356-1a97-448f-a63b-b9b6f1cbeabc)

Sonst bekommt man diese Fehlermeldung.

![image](https://github.com/user-attachments/assets/33e8b340-bc3c-45d3-9269-9379afa86e2d)

## add_task

```bash
add_task() {
    echo ""
    read -p "Enter Task Name: " name
    read -p "Enter Deadline: " deadline

    if [[ -z "$name" || -z "$deadline" ]]; then
        echo "Task name and deadline cannot be empty."
        return 1
    fi

    echo "${deadline}: ${name}" >> "$TODO_FILE"
    echo "Task (${name}) added successfully."
}
```
![image](https://github.com/user-attachments/assets/4dd19fe3-e2b2-4c71-8db0-664e03ec313f)


Hier wird der Benutzer aufgefordert, die Aufgabe und die Frist/ Deadline der Aufgabe einzugeben. Dann wird geprüft, ob die Eingaben nicht leer sind, und wenn dies der Fall ist, wird die Eingabe in einer Zeile gespeichert und in die Datei geschrieben.

```bash
  echo "${zeit}: ${name}" >> "$TODO_FILE"
```


# Version 2 -> mit update status

Wir wollten eine neue Variable zu unseren Aufgaben hinzufügen -> Status. Der Grund dafür ist, dass wir verstehen und lernen wollten, wie man den Inhalt einer Datei manipulieren kann. Hier wollen wir wissen, wie man eine bestimmte Zeile in einer Datei überschreiben kann.
![image](https://github.com/user-attachments/assets/7d0b6e68-b220-4831-8649-22b294770680)

### Link zum Array in bash
https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/

![image](https://github.com/user-attachments/assets/855820cc-a52f-4f9c-a288-8635da23150e)


![image](https://github.com/user-attachments/assets/c136a84e-1073-4bc9-996f-06dea158cb46)



Wie bei der Hauptfunktion wird der Benutzer befragt. Welche Aufgabe möchte er bearbeiten, dann den Status. Am Schluss wird der Status der Aufgabe im Datei bearbeitet.

```bash
update_status() {
    show_todos
 
    read -p "Choose the ToDo number to update: " ToDo_Number
 
    number=0
    echo "Available statuses:"
    for status in "${statusList[@]}"; do
        number=$((number + 1))
        echo "$number: $status"
    done
    
    read -p "Choose the status number: " statusNumber
    
    if [[ "$statusNumber" -lt 1 || "$statusNumber" -gt ${#statusList[@]} ]]; then
        echo "Invalid status number. Please try again."
        return
    fi
 
    lineNumber=$((ToDo_Number))
    
    
    newStatus="${statusList[$((statusNumber - 1))]}"
    sed -i "${lineNumber}s/Status: .*/Status: $newStatus/" "$TODO_FILE"
    
    echo "Task updated to '$newStatus'."
}
```
#### link wie man eine etwas ersetzen kann: overwrite
https://collectingwisdom.com/bash-replace-line-in-file/

Dieser Link half uns, die Syntax des Befehls sed -i zu verstehen 

```bash
sed -i '4s/.*/new text/' some_file.txt
```

In diesem Beispiel wird Zeile 4 in der Datei some_file.txt durch neuen Text ersetzt.

Der Operator -i gibt an, dass die Zeile in der Datei an Ort und Stelle ersetzt werden soll.

Wir waren aber nicht so ganz sicher wie sed -i funktioniert, weil der Link nicht alles erklärt, deshalb haben wir chat gpt gefragt

![image](https://github.com/user-attachments/assets/c10658aa-c699-41c9-8204-fea663efb47a)

Nachdem wir wussten, wie wir eine bestimmte Zeile überschreiben können, erstellen wir diesen sed -i Befehl

```bash
sed -i "${lineNumber}s/Status: .*/Status: $newStatus/" "$TODO_FILE"
```
Ausserdem haben wir im add_task etwas erweitert.

```bash
  echo "$zeit: $name, Status: ${statusList[0]}" >> "$TODO_FILE"
```
![image](https://github.com/user-attachments/assets/025ee0b5-25b8-42a1-99e8-4f4cb5694e0c)







# Version 3 -> refactor und clean codes.

Wir wollten lokale Variablen in den Funktionen haben, also haben wir die Datei und die Statusliste in die Parameter der Funktionen gesetzt

![image](https://github.com/user-attachments/assets/76141c5a-3a72-4efd-b2f0-fe13d98e3cb7)

![image](https://github.com/user-attachments/assets/d523de34-d821-4063-9a88-68dec09ed37a)


Das Problem ist, dass die Array-Liste nicht richtig funktioniert hat: in der Funktion „add_task“ der Status „is“ anstelle von „is starting“ .

![Screenshot 2025-01-13 152213](https://github.com/user-attachments/assets/8f411d04-1f59-46ed-ae91-6f30bc04a27f)

Wir dachten, dass mit der Array-Liste etwas nicht in Ordnung sein muss, also haben wir die Array-Liste anders initialisiert

### Link zum ArrayList
https://www.geeksforgeeks.org/bash-scripting-array/

![image](https://github.com/user-attachments/assets/a3061380-d149-4ce1-9720-6bb1117da21b)



![Screenshot 2025-01-15 162544](https://github.com/user-attachments/assets/e26dd0a5-e297-43a7-b3fc-4c0236d99a42)

Aber es hat trotzdem nicht funktioniert, deshalb haben wir einfach die Strings umbenennt.

![Screenshot 2025-01-15 163708](https://github.com/user-attachments/assets/27a6ddbd-31a9-4b4b-9d64-631d33a6cbd7)
![image](https://github.com/user-attachments/assets/7dda5194-9c55-498d-bf59-124e0f4698ab)

In Funktion show_todo ist die Liste nicht nummeriert. Deshalb wollen wir wissen, wie man Zeile für Zeile aus einem Text liest. Auf diese Weise können wir die Liste der Aufgaben leichter nummerieren.

![image](https://github.com/user-attachments/assets/94f51434-9752-458a-8b3f-ad6ae230fc09)

![image](https://github.com/user-attachments/assets/a659271a-00b5-4725-ac27-39f2670a2e19)

Hier gibt man einfach die Inhalte der Datei aus. -> nicht nummeriert.

### Link how to read line by line from file
https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/#google_vignette

![image](https://github.com/user-attachments/assets/b963a78e-5e39-4bd4-99bd-8ac286ba1f47)

![image](https://github.com/user-attachments/assets/3ab75aa2-949e-4b95-b9de-cca7aeb22450)

```bash
  echo ""
        local counter=0
        while read -r line; do
            ((counter++))
            echo "$counter: $line"
        done < "$todo_file"
        echo ""
```

![image](https://github.com/user-attachments/assets/fdf081c4-ce79-46bd-96cd-d14d3021bc0d)

Jetzt wird die Liste von der Datei nummeriert.

Das Problem, warum wir nur Status : „is“ statt „is starting“ erhalten, liegt darin, dass wir die Statusliste nicht in den Parameter eingegeben und den Wert für unsere lokale Variable nicht richtig zugewiesen haben.

![image](https://github.com/user-attachments/assets/eba47ee4-ee7f-47b2-b16f-9bdbb1fbe9ad)

![image](https://github.com/user-attachments/assets/5f7ded5d-fc77-473d-9421-e734f8ffffa0)

Wir müssen die lokale Variable als Array-Liste initialisieren. Die Variable ist also keine Array-Liste -> sie hat nur mehrere Werte. Deshalb müssen wir jeden Wert aus der Array-Liste nehmen und ihn in unsere lokale Variable setzen.

![image](https://github.com/user-attachments/assets/42ea7e53-d5be-41ba-9448-540d2408fc46)

![image](https://github.com/user-attachments/assets/4bc10c7f-9d82-4f9b-8cc0-7e0658842867)

![image](https://github.com/user-attachments/assets/06fa1a6e-22d5-4a66-8604-f8012a2c9d3b)

![image](https://github.com/user-attachments/assets/e71c4a23-0e67-4016-be78-99031a922dbc)

Jetzt funktioniert die Array Liste, aber im Show Todos wird 2 Listen angezeigt -> nummiert und nicht nummerniert

Code ist redundant
![image](https://github.com/user-attachments/assets/66c17d69-6a17-4475-a9ac-3fe04b7db9f2)

Wir haben zwei Codes die, das selbe machen -> Inhalte von File anzeigen

kürzere Code
![image](https://github.com/user-attachments/assets/4f3b80c0-89c7-4601-8744-2b295db036a2)
![image](https://github.com/user-attachments/assets/3f3a7cbd-9772-4f18-ae78-f3feb95201fc)

# Version 4 -> Inputs überprüfen ob sie valid sind.

## add tasks

### Link -> check if String is empty or not 
https://unix.stackexchange.com/questions/571037/check-for-non-empty-string-in-the-shell-instead-of-z

![image](https://github.com/user-attachments/assets/eef4acd9-5f50-4ab3-993c-46e1047794d8)


```bash
if_input_is_valid_add_task(){
  
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
```
Hier in der Funktion add task ist der Code viel einfacher zu lesen
```bash
 if if_input_is_valid_add_task $task $deadline; then
        echo ""
        echo "${deadline}: ${task}, Status: ${status_list[0]}" >> "$todo_file"
        echo "Task (${task}) added successfully."
        return 0
    else
        return 1
    fi
```

### output: 

![image](https://github.com/user-attachments/assets/e878ff76-05da-4051-a054-d0a69490b7b9)

![image](https://github.com/user-attachments/assets/9b1187c7-44b1-4134-a2c4-910325bd5225)



## input is not a number 

```bash
    if_input_is_number(){

    local input=$1

    if (( input + 0 )) 2>/dev/null; then
        return 0
    else 
        return 1
    fi
}

---------------------------------------------------

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
```

### output
![image](https://github.com/user-attachments/assets/c98c7c3e-d313-49fb-95e9-719d7b048fcd)

## Input is greater than amount of task

```bash
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
--------------------------------------------------------------
if if_input_is_greater_than_amount_of_tasks "$todo_file" $todo_number; then
    echo ""
    echo "Invalid input -> the number is not contained in the list. Please try again."
    echo ""
    return 3   
fi
    
```

## output 
![image](https://github.com/user-attachments/assets/471dc5ca-9ac7-4b21-b421-bd31f6df0b6d)

# Funktionen Beschreibungen geben

## Beispiel:

```bash
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
```

# Reflexion und Selbst Einschätzung

In den letzten Monaten haben wir eine Menge in der Bash gelernt. Wir haben viele Fortschritte in diesem Projekt gemacht und sind stolz darauf, dass wir viele Dinge implementiert haben, so dass unser ToDo-Listen-Manager perfekt funktioniert. Aber es gibt Dinge, die wir noch verbessern wollen.

Was haben wir gelernt?

Wir haben gelernt, wie Arraylist funktioniert und wie man sie richtig in den Parameter einfügt.

Wir haben gelernt, wie man mit dem Befehl -> read -r Zeile für Zeile aus einer Textdatei lesen kann.

Wir haben gelernt, wie man eine bestimmte Zeile in einer Datei überschreiben kann

Verbesserungsvorschläge

Wenn der Status „is finished ist, wollen wir, dass die Aufgabe aus der Datei gelöscht wird.

Die Arbeit mit Bash hat uns geholfen, unser Wissen von Bash in etwas Technisches umzuwandeln. Wir sind stolz auf unsere Fortschritte und freuen uns darauf, unser Wissen in zukünftigen Projekten anzuwenden.









