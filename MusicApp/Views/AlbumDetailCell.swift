//
//  AlbumDetailCell.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 04/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import UIKit

class AlbumDetailCell: UITableViewCell {
    
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.albumImageView.ma_setRoundedBorder(pCornerRadius: 6)
    }
    
    var albumInfo: AlbumInfo! {
        didSet {
            self.albumNameLabel.text = albumInfo.attributes.name
            guard let imageURL = albumInfo.attributes.artwork.imageURL(width: 200, height: 200) else { return }
            self.albumImageView.ma_downloadAndCacheImage(with: imageURL)
            self.albumGenreLabel.text = albumInfo.attributes.genreNames.first
            self.artistNameLabel.text = albumInfo.attributes.artistName
            self.trackNumberLabel.text = String(albumInfo.attributes.trackCount)
        }
    }
}
