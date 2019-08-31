//
//  ToDoListViewController.swift
//  Todoey
//
//  Created by Deepak on 8/31/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    //var itemArray = ["Find Mike" , "Buy Eggos" , "Destroy DemoGorgon"]
    var itemArray = [String]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let itemArray1 = defaults.array(forKey: "ToDoListArray") as? [String]  {
            itemArray = itemArray1
        }
        
        print(itemArray)

    }

    
    // MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    // MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: - Addnew Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add new Item Todey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Add item", style: .default) { (action) in
            //here what will happen when user add item
            print("Success")
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true , completion: nil)
        
    }
    
}

