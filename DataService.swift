//
//  DataService.swift
//  goal-app
//
//  Created by anna :)  on 8/31/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

var URL_BASE = "https://goal-tracker-app-e17c8.firebaseio.com/"

class DataService {
    
    static let ds = DataService()
    
    
    private var _REF_BASE = FIRDatabase.database().reference()
    private var _REF_USERS = FIRDatabase.database().referenceFromURL("\(URL_BASE)users")
    private var _REF_GOAL = FIRDatabase.database().referenceFromURL("\(URL_BASE)goalPost")
    
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_GOAL: FIRDatabaseReference {
        return _REF_GOAL
    }
    
    
    var REF_CURRENT_USER: FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(UID_KEY) as! String
        let user = FIRDatabase.database().referenceFromURL("\(URL_BASE)").child("users").child(uid)
        return user
    }
    
    var REF_USERS_POSTS: FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(UID_KEY) as! String
        let userPosts = FIRDatabase.database().referenceFromURL("\(URL_BASE)").child("users").child(uid).child("goalPost")
        return userPosts
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, AnyObject>) {
        
        REF_USERS.child(uid).setValue(user)
    }
    
}