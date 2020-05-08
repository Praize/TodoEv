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
    //userDefaults
    var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //finishing touches on userDefaults
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
        
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
            //userDefauits in action "save data inside app"
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            
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

