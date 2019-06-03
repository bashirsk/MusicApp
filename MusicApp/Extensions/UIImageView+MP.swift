//
//  UIImageView+MP.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func mp_downloadAndCacheImage(with pUrl: URL) {
        self.sd_setImage(with: pUrl)
    }
}
