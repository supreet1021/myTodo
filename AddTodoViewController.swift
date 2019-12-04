//
//  AddTodoViewController.swift
//  myTodo
//
//  Created by Supreet on 2019-12-02.
//  Copyright © 2019 Supreet. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
     var previousVC = ToDoTableViewController() 
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var smallDescription: UITextField!
    @IBOutlet weak var listname: UITextField!
    
    @IBAction func Cancel(_ sender: UIButton) {
    }
    @IBAction func Delete(_ sender: UIButton) {
    }
    @IBAction func Update(_ sender: UIButton) {
        let toDo = ToDo()
    toDo.Listname = listname.text!
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
         navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
