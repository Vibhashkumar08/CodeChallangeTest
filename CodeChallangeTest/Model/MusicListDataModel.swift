//
//  MusicListDataModel.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import Foundation

struct MusicResponseData : Codable {
    let resultCount: Int?
    let results: [MusicListDataModel]?
}



struct MusicListDataModel : Codable
{
    let wrapperType: String?
    let kind: String?
    let artistId: Int?
    let collectionId: Int?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let releaseDate: String?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let isStreamable: Bool?
    
    
}
