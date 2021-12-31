//
//  ViewController.swift
//  Instagram
//
//  Created by Hutomo Sakti Kartiko on 29/12/21.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticated()
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("failed signout")
        }
        
    }
    
    private func handleNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show loagi in
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc, animated: false)
        }
    }
}

