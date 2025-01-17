# m122_Projekt_Arbeit_ToDoListManager

Wir haben zuerst Gedanken gemacht, welche Funktionen unser ToDo List Manager haben soll. Natürlich gibt es 2 Funktionen -> Aufgaben erstellen und Aufgaben anzeigen. Die Beste Lösung wäre in einem txt.file Aufgaben schreiben und mit dem Kommando 'cat' die Inhalte des Files zu anzeigen.

Also begannen wir die Hauptfunktion, Funktion show_todos und Funktion add_task. Die Aufgaben werden im File todos.txt gespeichert. Wir waren sehr schnell fertig, darum haben wir eine zusätzliche Funktion namens update_status ausgedacht.

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

Wir haben eine einfache Abfrage Funktion gemacht, das den Nutzer fragt, welche Funktion der Nutzer ausführen will.

Ausserdem haben wir ein Java-Projekt gemacht und uns davon inspirieren lassen. 

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
Wie man sieht, sieht unser bash main application sehr ähnlich aus.

Der switch case von Java wird hier als case Statement ersetzt.

Jede Zahl wurde von einer Funktion erteilt. 

Also wenn man 1 eingibt, dann wird show_todos ausgeführt.

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

Wir haben hier eine einfache If Statement rein getan, das prüft, ob das File existiert. 
```bash
[[ -f "$TODO_FILE" ]]
```
![image](https://github.com/user-attachments/assets/39bf384a-da54-4f44-a545-3ce4ff75c217)

Dieser Test schaut, ob das File existiert, wenn ja, dann werden die Inhalte von File ausgedruckt.
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




# Version 2 -> mit update status

https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/



![Screenshot 2025-01-13 152213](https://github.com/user-attachments/assets/8f411d04-1f59-46ed-ae91-6f30bc04a27f)

![Screenshot 2025-01-15 162544](https://github.com/user-attachments/assets/e26dd0a5-e297-43a7-b3fc-4c0236d99a42)

![Screenshot 2025-01-15 163708](https://github.com/user-attachments/assets/27a6ddbd-31a9-4b4b-9d64-631d33a6cbd7)


![image](https://github.com/user-attachments/assets/7dda5194-9c55-498d-bf59-124e0f4698ab)

nummer list show todo

![image](https://github.com/user-attachments/assets/94f51434-9752-458a-8b3f-ad6ae230fc09)

![image](https://github.com/user-attachments/assets/a659271a-00b5-4725-ac27-39f2670a2e19)

https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/#google_vignette

![image](https://github.com/user-attachments/assets/42fd1f5a-3922-4832-a207-f55960accc82)


![image](https://github.com/user-attachments/assets/fdf081c4-ce79-46bd-96cd-d14d3021bc0d)











![image](https://github.com/user-attachments/assets/eba47ee4-ee7f-47b2-b16f-9bdbb1fbe9ad)

![image](https://github.com/user-attachments/assets/42ea7e53-d5be-41ba-9448-540d2408fc46)

![image](https://github.com/user-attachments/assets/4bc10c7f-9d82-4f9b-8cc0-7e0658842867)

![image](https://github.com/user-attachments/assets/06fa1a6e-22d5-4a66-8604-f8012a2c9d3b)

![image](https://github.com/user-attachments/assets/e71c4a23-0e67-4016-be78-99031a922dbc)


![image](https://github.com/user-attachments/assets/b8bc96c5-0cfe-4951-97e7-518faa443419)


update status funktioniert
![image](https://github.com/user-attachments/assets/d3d57ab9-846f-4d29-94cf-957231538b7a)





code is redundant
![image](https://github.com/user-attachments/assets/66c17d69-6a17-4475-a9ac-3fe04b7db9f2)

shorter code
![image](https://github.com/user-attachments/assets/4f3b80c0-89c7-4601-8744-2b295db036a2)
![image](https://github.com/user-attachments/assets/3f3a7cbd-9772-4f18-ae78-f3feb95201fc)


refactor update status
![image](https://github.com/user-attachments/assets/efc864c8-d75f-41bc-9cf2-1aa178626f3f)




