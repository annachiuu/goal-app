//
//  MasterButton.swift
//  goal-app
//
//  Created by anna :)  on 8/31/16.
//  Copyright © 2016 Anna Chiu. All rights reserved.
//

import UIKit

class MasterButton: UIButton {

    override func awakeFromNib() {
        
        layer.cornerRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    
    }

}
