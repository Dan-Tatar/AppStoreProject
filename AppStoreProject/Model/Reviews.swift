//
//  Reviews.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 11/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    var label : String
}
