//
//  UINavigationController+MA.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

