//
//  UITableView+MP.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

extension UITableView {
    
    /**
     - Set up delegation
     - Note mp means "Music App". The app's name
     */
    
    func mp_setUpTableView(with pDelegate: UITableViewDelegate & UITableViewDataSource) {
        self.delegate = pDelegate
        self.dataSource = pDelegate
        self.tableFooterView = UIView()
    }
    
    // Set up 'pull to refresh'
    func mp_setUpPulltoRefresh(with pSelector: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self.delegate, action: pSelector, for: .valueChanged)
        self.addSubview(refreshControl)
    }    
}
