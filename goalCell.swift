//
//  goalCell.swift
//  goal-app
//
//  Created by anna :)  on 9/4/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import Firebase
import FirebaseDatabase
import UIKit


class goalCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var goal: Goal!
    
    func configureCell(IndividualGoal: Goal) {
        self.goal = IndividualGoal
        titleLbl.text = IndividualGoal.title
        descLbl.text = IndividualGoal.description
    }

 
}
