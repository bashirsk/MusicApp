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
    let id, type, href: String
    var attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let artwork: Artwork
    let artistName: String
    let isSingle: Bool
    let url: String
    let isComplete: Bool
    let genreNames: [String]
    let trackCount: Int
    let isMasteredForItunes: Bool
    let releaseDate, name, recordLabel, copyright: String
    let editorialNotes: EditorialNotes?
    let contentRating: String?
}

// MARK: - Artwork
struct Artwork: Codable {
    let width, height: Int
    let url, bgColor, textColor1, textColor2: String
    let textColor3, textColor4: String
}

extension Artwork {
    func imageURL(width: Int, height: Int) -> URL? {
        let url = self.url
        let occurrences = url.replacingOccurrences(of: "{w}", with: "\(width)").replacingOccurrences(of: "{h}", with: "\(height)")
        return URL(string: occurrences)
    }
}

// MARK: - EditorialNotes
struct EditorialNotes: Codable {
    let short: String
    let standard: String?
}


