//
//  DatabaseManager.swift
//  Instagram
//
//  Created by intern on 7/2/23.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference() //reference is used to read and write data from database
    
    public func canCreateNewUser(with username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        let key = email.safeDatabaseKey()
        
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            }
            else{
                //failed
                completion(false)
                return
            }
            
        }
    }
}
