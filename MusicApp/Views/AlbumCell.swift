//
//  AlbumCell.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.albumImageView.ma_setRoundedBorder(pCornerRadius: 10)
    }
    
    var album: AlbumInfo! {
        didSet {
            self.albumNameLabel.text = album.attributes.name
            self.artistNameLabel.text = album.attributes.artistName
            guard let imageURL = album.attributes.artwork.imageURL(width: 100, height: 100) else { return }
            self.albumImageView.ma_downloadAndCacheImage(with: imageURL)
            self.albumReleaseDateLabel.text = String(album.attributes.releaseDate.ma_toDate.ma_toYear)
        }
    }
}
