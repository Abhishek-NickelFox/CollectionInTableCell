//
//  CCCollectionViewCell2.swift
//  CollectionInCell
//
//  Created by Abhishek on 06/06/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class CCCollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var txtLabel: UILabel!
    
    var tapped: Bool = false {
        didSet {
            if tapped {
                self.txtLabel.textColor = UIColor.white
                self.txtLabel.backgroundColor = UIColor.blue
            }
            else {
                self.txtLabel.textColor = UIColor.black
                self.txtLabel.backgroundColor = UIColor.white
            }
        }
    }
    
}
