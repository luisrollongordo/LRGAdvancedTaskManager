//
//  AddTaskTableViewController.swift
//  Storyboards_AppDemo
//
//  Created by Luis Rollon Gordo on 21/2/17.
//  Copyright © 2017 EfectoApple. All rights reserved.
//

import UIKit

class AddTaskTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    var task:Task?
    
    var priority:String = "Importancia Máxima" {
        didSet {
            detailLabel.text? = priority
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init AddTaskTableViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit AddTaskTableViewController")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveTaskDetail" {
            task = Task(name: nameTextField.text, priority:priority)
        }
        if segue.identifier == "PickPriority" {
            if let priorityTableViewController = segue.destination as? PriorityTableViewController {
                priorityTableViewController.selectedPriority = priority
            }
        }
    }
    
    //Unwind segue
    @IBAction func unwindWithSelectedTask(_ segue:UIStoryboardSegue) {
        if let priorityTableViewController = segue.source as? PriorityTableViewController,
            let selectedPriority = priorityTableViewController.selectedPriority {
            priority = selectedPriority
        }
    }
}
