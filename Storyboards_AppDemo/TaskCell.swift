//
//  TaskCell.swift
//  Storyboards_AppDemo
//
//  Created by Luis Rollon Gordo on 21/2/17.
//  Copyright © 2017 EfectoApple. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    var task: Task! {
        didSet {
            taskLabel.text = task.name
            priorityLabel.text = task.priority
        }
    }
}
