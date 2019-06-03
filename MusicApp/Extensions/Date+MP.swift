//
//  Date+MP.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 03/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import Foundation

extension Date {
    
    var mp_toYear: Int {
        let year = Calendar.current.component(.year, from: self)
        return year
    }
}

