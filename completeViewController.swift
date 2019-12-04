//
//  completeViewController.swift
//  myTodo
//
//  Created by Supreet on 2019-12-04.
//  Copyright © 2019 Supreet. All rights reserved.
//

import UIKit

class completeViewController: UIViewController {
    @IBOutlet weak var smallDescription: UILabel!
    @IBOutlet weak var lname: UILabel!
  
    @IBOutlet weak var Description: UILabel!
    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()
 

 
    
    @IBAction func Update(_ sender: Any) {
        let toDo = ToDo()
        toDo.Description = Description.text!
        toDo.smallDescription = smallDescription.text!
       lname.text = toDo.Listname
        
    
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
     
    }
    
    
    
    @IBAction func DeleteTapped(_ sender: UIButton) {
        var index = 0
        for toDo in previousVC.toDos
        {
            if toDo.Listname == selectedToDo.Listname{
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        
    }
    @IBAction func CancelTapped(_ sender: UIButton) {
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lname.text = selectedToDo.Listname
        smallDescription.text = selectedToDo.smallDescription
        Description.text = selectedToDo.Description
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
