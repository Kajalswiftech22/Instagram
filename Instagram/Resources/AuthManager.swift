//
//  AuthManager.swift
//  Instagram
//
//  Created by intern on 7/2/23.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DatabaseManager.shared.canCreateNewUser(with: email, email: username, password: password) { success in
            if success {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else{
                        completion(false)
                        return
                    }
                    //Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else {
                            //Failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //either username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            print(username)
    }
}

public func logOut(completion: (Bool) -> Void) {
    do{
        try Auth.auth().signOut()
        completion(true)
        return
    }
    catch{
        print(error)
        completion(false)
        return
    }
    }
}
