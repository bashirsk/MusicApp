//
//  AlbumDetailViewController.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AlbumDetailViewController: BaseViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private let cellId = "DetailCell"
    let imageView = UIImageView()
    var albumInfo: AlbumInfo?

    // MARK:- TableView row set up

    enum TableRow {
        case detailCell
    }
    
    var tableRows = [TableRow]()

    // MARK:- UIViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRows =  [.detailCell]
        self.tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        self.setHeaderImageView()
    }
    
    override func viewWillAppear(_ pAnimated: Bool) {
        super.viewWillAppear(pAnimated)
        guard let theAlbum = self.albumInfo else { return }
        if let imageURL = theAlbum.attributes.artwork.imageURL(width: 500, height: 500) {
            self.imageView.ma_downloadImage(with: imageURL)
        }
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.activityIndicator.ma_animating = true
    }

    // Stop animating when view appears
    override func viewDidAppear(_ pAnimated: Bool) {
        super.viewDidAppear(pAnimated)
        self.activityIndicator.ma_animating = false
    }

    // Set up header  
    private func setHeaderImageView() {
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.view.addSubview(imageView)
    }

    // Change status bar color 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK:- TableView set up
    
    override var tableViewArray: [[Any]] {
        return [self.tableRows]
    }
    
    private func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return self.itemForIndexPath(indexPath: pIndexpath) as! TableRow
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension AlbumDetailViewController {
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let cell = pTableView.dequeueReusableCell(withIdentifier: self.cellId, for: pIndexPath) as! AlbumDetailCell
        switch self.objectForIndexPath(indexPath: pIndexPath) {
        case .detailCell:
            cell.albumInfo = self.albumInfo
        }
        return cell
    }
    
    func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        return 315
    }

    func tableView(_ pTableView: UITableView, didSelectRowAt pIndexPath: IndexPath) {
        pTableView.deselectRow(at: pIndexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ pScrollView: UIScrollView) {
        let y = 300 - (pScrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 500)
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}
