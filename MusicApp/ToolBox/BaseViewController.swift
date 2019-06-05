//
//  BaseViewController.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let theTableView = self.tableView else { return }
        theTableView.ma_setUpTableView(with: self)
    }
    
    // MARK:- UIViewController control set up
    
    /**
     - These are set up at the beginning incase they are needed later
     */
    
    func doDismiss(completion pCompletion: (() -> Void)? = nil) {
        self.presentingViewController?.dismiss(animated: true, completion: pCompletion)
    }
    
    func pushViewController(with pViewController: UIViewController) {
        self.navigationController?.pushViewController(pViewController, animated: true)
    }
    
    
    // MARK:- TableView set up
    
    /**
     - Can be used to both basic and tableview with sections
     */

    var tableViewArray: [[Any]] {
        return []
    }
    
    func itemForIdenxPath(indexPath pIndexPath: IndexPath) -> Any {
        return self.tableViewArray[pIndexPath.section][pIndexPath.row]
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
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
