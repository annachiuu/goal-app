//
//  addGoalVC.swift
//  goal-app
//
//  Created by anna :)  on 9/4/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import UIKit

class addGoalVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func postToFirebase() {
        
        var goal: Dictionary<String, AnyObject> = ["title":titleTextField.text!,"description": descTextView.text!]
        if titleTextField.text != "" {
            let firebasePost = DataService.ds.REF_CURRENT_USER.child("goalPost").childByAutoId()
            firebasePost.setValue(goal)
        
            titleTextField.text = ""
            descTextView.text = ""
            
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
    }
    

}
