//
//  TasksViewController.swift
//  Storyboards_AppDemo
//
//  Created by Luis Rollon Gordo on 21/2/17.
//  Copyright © 2017 EfectoApple. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    var tasks:[Task] = tasksData
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
                as! TaskCell
            
            let task = tasks[indexPath.row] as Task
            cell.task = task
            return cell
    }
    
    // Mark Unwind Segues
    @IBAction func cancelToTasksViewController(_ segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveTaskDetail(_ segue:UIStoryboardSegue) {
        if let addTaskTableViewController = segue.source as? AddTaskTableViewController {
            
            //add the new task to the tasks array
            if let task = addTaskTableViewController.task {
                tasks.append(task)
                
                //update the tableView
                let indexPath = IndexPath(row: tasks.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }


}
