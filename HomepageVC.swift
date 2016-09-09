//
//  HomepageVC.swift
//  goal-app
//
//  Created by anna :)  on 9/4/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class HomepageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var goals = [Goal]()
    
//    var testDescription = "Read the Power of Habit every morning while commuting on the Metro"
    
//    var testGoal = Goal(title: "MORNING READ", description: "Testing my goal description: Reading on the train every morning makes me feel fresh")
//    
//    var testGoal2 = Goal()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_USERS_POSTS.observeEventType(.Value,withBlock:  { (snapshot) in            
            
            //clear the array everytime
            self.goals = []
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    
                    if let goalDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let goal = Goal(goalKey: key, dictionary: goalDict)
                        
                        self.goals.append(goal)
                        
                    }
                    
                }
                
            }
            
            self.tableView.reloadData()
                
            })
        }

//        goals.append(testGoal)
//        goals.append(testGoal2)
    
    @IBAction func addGoalPage(sender: AnyObject) {
        self.performSegueWithIdentifier("toAddGoal", sender: nil)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let goal = goals[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("newGoal") as? goalCell {
            
//            cell.request?.cancel()
            
            cell.configureCell(goal)
            
            return cell
        } else {
            return goalCell()
        }
        
    }
    
    @IBAction func logout(sender: AnyObject) {
        
        try! FIRAuth.auth()!.signOut()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }

}
