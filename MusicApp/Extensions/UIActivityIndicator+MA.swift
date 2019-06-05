//
//  UIActivityIndicator+MA.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 05/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {

    var ma_animating: Bool {
        get {
            return self.isAnimating
        }
        set {
            newValue ? self.startAnimating() : self.stopAnimating()
        }
    }
}

