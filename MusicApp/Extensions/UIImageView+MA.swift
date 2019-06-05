//
//  UIImageView+MA.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {

    // Use SDWebImage to download image and cache it 
    func ma_downloadImage(with pUrl: URL) {
        self.sd_setImage(with: pUrl)
    }
}
