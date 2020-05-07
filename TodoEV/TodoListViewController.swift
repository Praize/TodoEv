//
//  ViewController.swift
//  TodoEV
//
//  Created by Hawk Mobile on 2020/05/07.
//  Copyright © 2020 Seneme Nyuswa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["orange","apple","bread","milk"]
    
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

}

