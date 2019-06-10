//
//  AlbumViewController.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AlbumViewController: BaseViewController {
    
    private let cellId = "AlbumCell"
    var albumInfo = [AlbumInfo]()
    let apiService = APIService()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK:- UIViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSearchBar()
    }

    // Pass album information to the AlbumDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlbumSegue" {
            let albumDetailViewController = segue.destination as! AlbumDetailViewController
            let albumData = sender as? AlbumInfo
            albumDetailViewController.albumInfo = albumData
        }
    }
    
    //MARK:- Search bar set up
    
    private func setUpSearchBar() {
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
        self.searchController.definesPresentationContext = true
        self.searchController.searchBar.tintColor = .black
    }
    
    // MARK:- TableView set up
    
    override var tableViewArray: [[Any]] {
        return [self.albumInfo]
    }
    
    private func objectforIndexPath(_ pIndexPath: IndexPath) -> AlbumInfo {
        return self.itemForIndexPath(indexPath: pIndexPath) as! AlbumInfo
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension AlbumViewController {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please enter an album search term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }
    
    func tableView(_ pTableView: UITableView, heightForHeaderInSection pSection: Int) -> CGFloat {
        return self.tableViewArray[pSection].count > 0 ? 0 : 250
    }
    
    override func tableView(_ pTableView: UITableView, cellForRowAt pIndexPath: IndexPath) -> UITableViewCell {
        let cell = pTableView.dequeueReusableCell(withIdentifier: self.cellId, for: pIndexPath) as! AlbumCell
        let albums = self.albumInfo[pIndexPath.row]
        cell.album = albums
        return cell
    }
    
    func tableView(_ pTableView: UITableView, didSelectRowAt pIndexPath: IndexPath) {
        pTableView.deselectRow(at: pIndexPath, animated: true)
        let selectedaAlbum = self.albumInfo[pIndexPath.row]
        self.performSegue(withIdentifier: "AlbumSegue", sender: selectedaAlbum)
    }
    
    func tableView(_ pTableView: UITableView, heightForRowAt pIndexPath: IndexPath) -> CGFloat {
        return 132
    }
}

//MARK:- UITableViewDelegate

extension AlbumViewController: UISearchBarDelegate {
    
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
}

