//
//  main.swift
//  TestCLI
//
//  Created by Razan bin rashed on 22/05/1443 AH.
//

class TodoList {
    var taskList : Array<Task>
    init(){
        taskList = Array()
    }
    
    //function to display all the task and statue
    func listAllTasks(){
        print("--------Your To-Do List---------")
        
        if(taskList.count > 0){
            for (index, task) in taskList.enumerated() {
                print("\(index+1)- \(task.formattedStringOfTask())")
            }
        }else{
            print("You don't have a To-do π")
        }
        print("---------------------------------")
        
    }
    //    function to add new task
    func addToDoListItem  (){
        var newTaskName :String
        print("Enter your new To-do task βπ»:")
        if let userInput = readLine(){
            newTaskName = userInput
            self.taskList.append(Task(taskName: newTaskName, isDone: false))
            print("Your To-do task saved βοΈ")
        }else{
            print("You did not enter the input correctly β")
        }
        
    }
    //    function to remove the task
    func RemoveToDoListItem (){
        var taskIndex :Int
        if(taskList.count == 0){
            print("Your To-do list is Empty π, the system can't remove β")
        }else{
            print("\n Enter the Todo task index for deleteπ:")
            if let userInput = readLine() {
                taskIndex = Int(userInput)!
                let task = taskList.index(before: taskIndex)
                taskList.remove(at: task)
                print("Your To-do task removed βοΈ")
            }else{
                print("You did not enter the input correctly β")
            }
            
        }
    }
    // function to update the taske title
    func UpdateToDoListItem (){
        var taskIndex :Int
        var newTaskName :String
        if(taskList.count == 0){
            print("Your To-do list is Empty π, the system can't update β")
        }else{
            print("\n Enter the Todo task index for updating β:")
            if let userInput = readLine() {
                taskIndex = Int(userInput)!
                let task = taskList.index(before: taskIndex)
                for (index, item ) in taskList.enumerated() {
                    if index == task {
                        if item.getIsDone(){
                            print("You complete your task successfully π₯³, the system can't update β")
                        }else{
                            print("Enter your new To-do task βπ»:")
                            if let userInput = readLine() {
                                newTaskName = userInput
                                item.setTaskName(taskName: newTaskName)
                                print("Your To-do task updated β")
                            }
                        }
                        
                    }
                }
                
            }else{
                print("You did not enter the input correctly β")
            }
            
        }
        
    }
    //    function to make the task Done
    func MarkDoneForToDoListItem (){
        var taskIndex :Int
        if(taskList.count == 0){
            print("Your To-do list is Empty π,the system can't mark Done β")
        }else{
            print("\n Enter the Todo task index for maked Done π₯³:")
            if let userInput = readLine() {
                taskIndex = Int(userInput)!
                let task = taskList.index(before: taskIndex)
                for (index, item ) in taskList.enumerated() {
                    if index == task {
                        item.markIsDone()
                        print("Your To-do task Done βοΈ")
                    }
                }
            }else{
                print("You did not enter the input correctly β")
            }
            
        }
        
    }
    
    
}
// task class
class Task{
    var  taskName : String = ""
    var  isDone : Bool
    init(taskName:String,isDone:Bool){
        self.taskName = taskName
        self.isDone = isDone
    }
    func getTaskName() -> String {
        return self.taskName
    }
    func setTaskName(taskName:String)  {
        self.taskName = taskName
    }
    func getIsDone() -> Bool {
        return self.isDone
    }
    func setIsDone(isDone:Bool)  {
        self.isDone = isDone
    }
    func markisInDone() {
        self.isDone = false
    }
    func markIsDone(){
        self.isDone = true
    }
    //    print task in formated way
    func formattedStringOfTask()-> String{
        var comStatus : String?
        if isDone == true {
            comStatus = "Completed β"
        }else{
            comStatus = "Not Completed β"
        }
        return """
                Your To-do task is π: \(taskName), Status β: \(comStatus!)
                """
    }
}

// main page
let  todoList = TodoList()
var menuChoice :String = ""

print("""
      Welcome to To-Do app β,
           choice what you option from the menu
      
                 1- Display your to-do list π
                 2- Add new to-do item β
                 3- Mark as Done π₯³
                 4- Upate to-do item β
                 5- Remove to-do item π
                 0- Exit β
      """)
while(menuChoice != "0") {
    print("\n Enter your option choice from menu β¨οΈ:")
    if let  userInput = readLine(){
        menuChoice = userInput
        switch menuChoice {
        case "1":
            todoList.listAllTasks()
        case "2":
            todoList.addToDoListItem()
        case "3":
            todoList.MarkDoneForToDoListItem()
        case "4":
            todoList.UpdateToDoListItem()
        case "5":
            todoList.RemoveToDoListItem()
        case "0":
            break;
        default:
            print("please, Enter your menu choice 1,2,3,4, or 0  β¨οΈ:")
        }
    }
}
