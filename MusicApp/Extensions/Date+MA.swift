//
//  Date+MA.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import Foundation

extension Date {
    
    var ma_toYear: Int {
        let year = Calendar.current.component(.year, from: self)
        return year
    }
}
