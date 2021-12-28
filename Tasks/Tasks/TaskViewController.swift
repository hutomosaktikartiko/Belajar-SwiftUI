//
//  TaskViewController.swift
//  Tasks
//
//  Created by Hutomo Sakti Kartiko on 27/12/21.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        let defaults = UserDefaults();
        var tasks = defaults.value(forKey: "tasks") as? [String] ?? [String]()
        tasks.remove(at: tasks.firstIndex(of: task!)!)
        defaults.setValue(tasks, forKey: "tasks")
    
        // Reload
        update?()
        // Navigator back
        navigationController?.popViewController(animated: true)
    }
    
    
}
