//
//  AlbumDetailViewController.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AlbumDetailViewController: BaseViewController {
    
    let imageView = UIImageView()
    var albumInfo: AlbumInfo?
    
    enum TableRow {
        case albumCell, detailCell
    }
    
    var tableRows = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRows =  [.albumCell, .detailCell]
        self.tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        self.tableView.scrollIndicatorInsets = UIEdgeInsets(top: 500, left: 0, bottom: 0, right: 0)
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.view.addSubview(imageView)        
    }
    
    override func viewWillAppear(_ pAnimated: Bool) {
        super.viewWillAppear(pAnimated)
        if let theAlbum = self.albumInfo {
            guard let imageURL = theAlbum.attributes.artwork.imageURL(width: 500, height: 500) else { return }
            self.imageView.ma_downloadAndCacheImage(with: imageURL)
        }
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var tableViewArray: [[Any]] {
        return [self.tableRows]
    }
    
    func objectForIndexPath(indexPath pIndexpath: IndexPath) -> TableRow {
        return self.itemForIdenxPath(indexPath: pIndexpath) as! TableRow
    }
}

extension AlbumDetailViewController {
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let cell = pTableView.dequeueReusableCell(withIdentifier: "DetailCell", for: pIndexPath) as! AlbumDetailCell
        switch self.objectForIndexPath(indexPath: pIndexPath) {
        case .detailCell:
            cell.albumInfo = self.albumInfo
        default:
            break
        }
        return cell
    }
    
    func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        switch self.objectForIndexPath(indexPath: pIndexPath) {
        case .albumCell:
            return 0
        case .detailCell:
            return 305
        }
    }
    
    func tableView(_ pTableView: UITableView, didSelectRowAt pIndexPath: IndexPath) {
        pTableView.deselectRow(at: pIndexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ pScrollView: UIScrollView) {
        let y = 300 - (pScrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}
