//
//  GoalCellImgLayover.swift
//  goal-app
//
//  Created by anna :)  on 9/4/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import Foundation
import UIKit

class MasterLayover: UIView {
    
    override func awakeFromNib() {
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4.0
    }
    
    
}