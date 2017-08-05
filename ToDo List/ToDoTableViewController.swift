//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Mostafa Taha on 8/1/17.
//  Copyright © 2017 Mostafa Taha. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos:[ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = creaToDo()
        
    }
    
    func creaToDo()->[ToDo]{
        let egg = ToDo()
        egg.name = "By Egg"
        egg.isImportant = true
        
        let dog = ToDo()
        dog.name = "Walk the dog"
        
        let cheese = ToDo()
        cheese.name = "Eat cheese"
        
        return [egg,dog,cheese]
    }

    

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let todo = toDos[indexPath.row]
        
        if todo.isImportant {
          cell.textLabel?.text = "❗️ \(todo.name)"
        } else {
            cell.textLabel?.text = todo.name
        }
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: todo)
    }
    // to make referance to anotherviewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController{
        addVC.previuosVC = self
     }
        
        if let completeVC = segue.destination as?  detailsViewController {
            if let toDo = sender as? ToDo {
                completeVC.selectToDo = toDo
                completeVC.previuosVC = self
            }
 }
    
        
    

    }

}
