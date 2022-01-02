//
//  AuthManager.swift
//  Instagram
//
//  Created by Hutomo Sakti Kartiko on 29/12/21.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - Check if username is available
         - Check if email is available
        */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - Create account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) {result, error in
                    guard error == nil, result != nil else {
                        // Firebase auth could not create account
                        completion(false)
                        
                        return
                    }
                    
                    // Insert into database
                    DatabaseManager.shared.inserNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            
                            return
                        } else {
                            // failed to insert to database
                            completion(false)
                            
                            return
                        }
                    }
                }
            } else {
                // Either username or email does not exist
                completion(false)
            }
        }
       
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // Email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    
                    return
                }
                
                completion(true)
            }
        } else if let username = username {
            // Username login
            print(username)
        }
    }
    
    /// Attemp to log out firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            
            return
        } catch {
            print(error)
            completion(false)
            
            return
        }
    }
}
