//
//  UITableView+MA.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UITableView {
    
    /**
     - Set up delegation
     - Note ma means "Music App". The app's name
     */
    
    func ma_setUpTableView(with pDelegate: UITableViewDelegate & UITableViewDataSource) {
        self.delegate = pDelegate
        self.dataSource = pDelegate
        self.tableFooterView = UIView()
    }
    
    // Set up 'pull to refresh'
    func ma_setUpPulltoRefresh(with pSelector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self.delegate, action: pSelector, for: .valueChanged)
        self.addSubview(refreshControl)
    }
}
