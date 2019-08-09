//
//  TodayItem.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 29/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

struct TodayItem {
    
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    let cellType: CellType
    
    enum CellType: String {
        case single, multiple
    }
}
