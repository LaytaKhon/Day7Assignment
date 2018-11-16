//
//  ImageCollectionViewCell.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/16/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import SDWebImage
class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ui image=>test")

    }
    
}
