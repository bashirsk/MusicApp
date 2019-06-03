//
//  String.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 03/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import Foundation

extension String {
    
    var mp_toDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let yourDate = formatter.date(from: self) {
            return yourDate
        }
        return Date()
    }
}
