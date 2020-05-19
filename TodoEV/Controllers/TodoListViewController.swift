//
//  ViewController.swift
//  TodoEV
//
//  Created by Hawk Mobile on 2020/05/07.
//  Copyright © 2020 Seneme Nyuswa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController ,UITextFieldDelegate{

    //var itemArray = ["orange","apple","bread","milk","orange","app1le","breqad","miwlk","orrange","apyple","breasd","maailk","orantge","apyple","brtread","mierlk","oruiange","atttpple","breanbd","mivlk","ocrange","apploe","bredqbad","milkeee"]
    var itemArray = [Item]()
    
    //userDefaults
    var defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = Item()
        newItem.title = "mike"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "mike1"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "mike2"
        itemArray.append(newItem2)
        
        //userDefaults
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
       
        
    }
    //MARK: - METHODS FOR DATASOURCE

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return itemArray.count
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
      //cell.textLabel?.text = itemArray[indexPath.row]
        cell.textLabel?.text = itemArray[indexPath.row].title
        
//        if itemArray[indexPath.row].done == true {
//            cell.accessoryType = .checkmark
//        }
//        else{
//            cell.accessoryType = .none
//        }
      cell.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
      return cell
        
    }
    //MARK: - METHODS FOR Didselect
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        }
//        else{
//            itemArray[indexPath.row].done = false
//        }
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
         tableView.reloadData()
        
        tableView.deselectRow(at:indexPath , animated: true)
    }
    //MARK: - nEW items
    @IBAction func addButtonPressed(_ sender: Any) {
        //create a type of UITextfield
        var textField = UITextField()
        
        //add alert
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
       
        
        //add action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happens when pressed
            let newItem = Item()
            newItem.title = textField.text!
       
            self.itemArray.append(newItem)
            //user defaults used
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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

