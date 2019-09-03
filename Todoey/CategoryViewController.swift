//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Deepak on 9/3/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    var categories: Results<Category>?
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }
    
    
    // MARK: - Table view Data source methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) 
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added yet"
    
        return cell
    }
    
    // MARK: - Data Manipulation Methods
    
    func saveData(category : Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch  {
            print("trying to save get error \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
        
        categories = realm.objects(Category.self)
        tableView.reloadData()


    }
    
    // MARK: - Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Catgory", style: .default) { (alertAction) in
             print("add new category")
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            //self.categories.append(newCategory)
            self.saveData(category: newCategory)
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Add new Category"
            textField = alertTextfield
        }
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
        
        
    }
    // MARK: - Table view Delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexpath.row]
        }
        
        
    }
    
}
