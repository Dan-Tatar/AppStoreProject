//
//  SearchResult.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 08/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    var resultCount: Int
    var results: [Results]
 
}

struct Results: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}
