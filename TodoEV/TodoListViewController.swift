//
//  ViewController.swift
//  TodoEV
//
//  Created by Hawk Mobile on 2020/05/07.
//  Copyright © 2020 Seneme Nyuswa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController ,UITextFieldDelegate{

    var itemArray = ["orange","apple","bread","milk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: - METHODS FOR DATASOURCE

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return itemArray.count
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
      cell.textLabel?.text = itemArray[indexPath.row]
       
        
      return cell
        
    }
    //MARK: - METHODS FOR Didselectß
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //add check mark progmmatically
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at:indexPath , animated: true)
    }
    //MARK: - nEW items
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        
        //add alert
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
       
        
        //add action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //whatr happens when pressed
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        //add textfieled
        alert.addTextField { (alertTextField) in
             alertTextField.placeholder = "create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    

}

