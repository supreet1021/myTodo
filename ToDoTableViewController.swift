//
//  ToDoTableViewController.swift
//  myTodo
//
//  Created by Supreet on 2019-11-27.
//  Copyright © 2019 Supreet. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDos : [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        toDos = createToDoList()
    }
    
    func createToDoList() ->  [ToDo]
    {
        let grocery = ToDo()
        grocery.Listname = "Grocery"
        grocery.done = true
        grocery.smallDescription = "weekly grocery"
        grocery.Description = "milk"
 
        
        let assignment = ToDo()
        assignment.Listname = "Assignment"
          assignment.smallDescription = "ios assignment"
     assignment.Description = "assignment 2 "
        
        let interview = ToDo()
      interview.Listname = "Interview"
           interview.done = true
         interview.smallDescription = "job interview"
       interview.Description = "walmart"
        
        let project = ToDo()
        project.Listname = "Project milestone"
     project.smallDescription = "android project"
        project.Description = "Description"
        
        return [grocery,assignment,project,interview]
        
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        if toDo.done
        {
               cell.textLabel?.text =  "❗️" + toDo.Listname
            
        }
        else
        {
                    cell.textLabel?.text = toDo.Listname
        }
        


        return cell
    }
   
    

    
        
   
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }

    override func prepare (for segue:UIStoryboardSegue, sender:Any?){
        if let  addVC = segue.destination as? AddTodoViewController{
        addVC.previousVC = self
        }
        if let completeVC = segue.destination as? completeViewController{
            if let toDo = sender as? ToDo
            {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
            
        }
    }
}
