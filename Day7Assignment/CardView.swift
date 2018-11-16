//
//  CardView.swift
//  Day7Assignment
//
//  Created by MIT App Dev on 11/11/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 2
    @IBInspectable var shadowOffSetWidth : Int = 0
    @IBInspectable var shadowOffSetHeight : Int = 2
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    @IBInspectable var shadowOpacity : Float = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
