//
//  EntryViewController.swift
//  Tasks
//
//  Created by Hutomo Sakti Kartiko on 27/12/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    @objc func saveTask() {
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        let defaults = UserDefaults()
        var tasks = defaults.value(forKey: "tasks") as? [String] ?? [String]()
        tasks.append(text)
        defaults.setValue(tasks, forKey: "tasks")
        
        update?()
        navigationController?.popViewController(animated: true)
    }
}
