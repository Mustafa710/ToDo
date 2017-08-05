//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Mostafa Taha on 8/1/17.
//  Copyright © 2017 Mostafa Taha. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    // to make referance to todotableViewController
    
    var previuosVC = ToDoTableViewController()
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addbuttontTapped(_ sender: Any) {
        
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            
            toDo.name = titleText
            toDo.isImportant = importantSwitch.isOn
            
            previuosVC.toDos.append(toDo)
        }
        
        
        // func to tell tableView that is something change
        previuosVC.tableView.reloadData()
        
        // to return to previuos viewController
        navigationController?.popViewController(animated: true)
    }
    
    
    
    

}
