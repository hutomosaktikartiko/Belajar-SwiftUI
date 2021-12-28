//
//  ViewController.swift
//  Tasks
//
//  Created by Hutomo Sakti Kartiko on 27/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"

        tableView.delegate = self
        tableView.dataSource = self
        
        let defaults = UserDefaults();
        
        // Setup
        if !defaults.bool(forKey: "setup") {
            defaults.set(true, forKey: "setup")
            defaults.set([], forKey: "tasks")
        }
        
        // Get all current saved tasks
        updateTasks()
    }
    
    func updateTasks() {
        tasks.removeAll()
        
        let defaults = UserDefaults();
        let tasksFromDefault = defaults.value(forKey: "tasks") as? [String] ?? [String]();
        tasks = tasksFromDefault;

        tableView.reloadData()
        
    }
    
    @IBAction func didTapAdd() {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "Detail Task"
        vc.task = tasks[indexPath.row]
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
}
