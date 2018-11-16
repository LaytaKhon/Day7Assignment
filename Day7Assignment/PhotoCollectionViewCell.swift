//
//  PhotoCollectionViewCell.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/13/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var continerView: UIView!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbtype: UILabel!
    
    override func awakeFromNib() {
        continerView.layer.cornerRadius = 6
        continerView.layer.masksToBounds = true
    }
}
