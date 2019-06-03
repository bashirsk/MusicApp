//
//  UIView+MP.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 03/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UIView {
    
    func mp_setRoundedBorder(pCornerRadius: CGFloat, pBorderWidth: CGFloat = 0, pBorderColor: UIColor? = nil) {
        self.layer.cornerRadius = pCornerRadius
        self.layer.borderColor = pBorderColor?.cgColor
        self.layer.borderWidth = pBorderWidth
        self.layer.masksToBounds = true 
    }
}
