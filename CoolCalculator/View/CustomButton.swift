//
//  CustomButton.swift
//  CoolCalculator
//
//  Created by Carleton Snow on 6/10/21.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        customizedView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customizedView()
    }
    
    func customizedView() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 25
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 5.0
        layer.masksToBounds = false
    }

}
