//
//  DetailCollectionViewCell.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/16/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var firstBrewed: UILabel!
    @IBOutlet weak var descText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
