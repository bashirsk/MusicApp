//
//  ArtistsViewController.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class ArtistsViewController: BaseViewController, UISearchBarDelegate {
    
    private let cellId = "AlbumCell"
    var albumInfo = [AlbumInfo]()
    let apiService = APIService()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
        self.searchController.definesPresentationContext = true
    }
    
    func searchBar(_ pSearchBar: UISearchBar, textDidChange pSearchText: String) {
        let searchTerm = pSearchText.replacingOccurrences(of: " ", with: "+")
        apiService.fetchGenericData(urlString:"https://api.music.apple.com/v1/catalog/us/search?term=\(searchTerm)&types=albums")
        { (pAlbumInfo: AlbumObject?, pError) in
            if let albumData = pAlbumInfo?.results.albums.data {
                self.albumInfo = albumData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override var tableViewArray: [[Any]] {
        return [self.albumInfo]
    }
    
    private func objectforIndexPath(_ pIndexPath: IndexPath) -> AlbumInfo {
        return self.itemForIdenxPath(indexPath: pIndexPath) as! AlbumInfo
    }
}
C
extension ArtistsViewontroller {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please enter a album search term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.albumInfo.count > 0 ? 0 : 250
    }
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let cell = pTableView.dequeueReusableCell(withIdentifier: self.cellId, for: pIndexPath) as! AlbumCell
        let albums = self.albumInfo[pIndexPath.row]
        cell.album = albums
        return cell
    }
    
    func tableView(_ pTableView: UITableView, didSelectRowAt pIndexPath: IndexPath) {
        pTableView.deselectRow(at: pIndexPath, animated: true)
    }
    
    func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        return 132
    }
}
