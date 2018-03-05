//
//  PriorityTableViewController.swift
//  Storyboards_AppDemo
//
//  Created by Luis Rollon Gordo on 21/2/17.
//  Copyright © 2017 EfectoApple. All rights reserved.
//

import UIKit

class PriorityTableViewController: UITableViewController {

    var priorities:[String] = [
        "Importancia Máxima",
        "Urgente",
        "Muy Importante",
        "Importante",
        "Normal",
        "Poco Importante"]
    
    var selectedPriority:String? {
        didSet {
            if let priority = selectedPriority {
                selectedPriorityIndex = priorities.index(of: priority)!
            }
        }
    }
    
    var selectedPriorityIndex:Int?
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priorities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = priorities[indexPath.row]
        
        if indexPath.row == selectedPriorityIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Otra celda ha sido seleccionada, tenemos que deseleccionar esta
        if let index = selectedPriorityIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedPriority = priorities[indexPath.row]
        
        //Actualiza el check para la celda actual
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSelectedTask" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                if let index = indexPath?.row {
                    selectedPriority = priorities[index]
                }
            }
        }
    }

}
