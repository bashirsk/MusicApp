//
//  BaseViewController.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    /**
     - This is used by all subclasses therefore we don't need to set up each one in every subclass that uses a tableview
     */
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let theTableView = self.tableView else { return }
        theTableView.ma_setUpTableView(with: self)
    }
    
    // MARK:- TableView set up
    
    /**
     - Can be used to both basic and tableview with sections
     */

    var tableViewArray: [[Any]] {
        return []
    }
    
    func itemForIndexPath(indexPath pIndexPath: IndexPath) -> Any {
        return self.tableViewArray[pIndexPath.section][pIndexPath.row]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {


    // No need to set up number of rows in all the subclasses. It is all set up here
    func numberOfSections(in pTableView: UITableView) -> Int {
        return self.tableViewArray.count
    }
    
    func tableView(_ pTableView: UITableView, numberOfRowsInSection pSection: Int) -> Int {
        return self.tableViewArray[pSection].count
    }
    
    func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
