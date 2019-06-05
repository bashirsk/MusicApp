//
//  AlbumObject.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 03/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import Foundation

// MARK: - All codable objects

// MARK: - Album Object
struct AlbumObject: Codable {
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let albums: Albums
}

// MARK: - Albums
struct Albums: Codable {
    let data: [AlbumInfo]
}

// MARK: - Datum
struct AlbumInfo: Codable {
    var attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let artwork: Artwork
    let artistName: String
    let url: String
    let isComplete: Bool
    let genreNames: [String]
    let trackCount: Int
    let releaseDate, name, recordLabel: String
    let editorialNotes: EditorialNotes?
}

// MARK: - Artwork
struct Artwork: Codable {
    let url: String
}

extension Artwork {
    func imageURL(width pWidth: Int, height pHeight: Int) -> URL? {
        let url = self.url

        // Replace both {w} and {h} with actual size images we would like
        let occurrences = url.replacingOccurrences(of: "{w}", with: "\(pWidth)").replacingOccurrences(of: "{h}", with: "\(pHeight)")
        return URL(string: occurrences)
    }
}

// MARK: - EditorialNotes
struct EditorialNotes: Codable {
    let short: String
    let standard: String?
}


