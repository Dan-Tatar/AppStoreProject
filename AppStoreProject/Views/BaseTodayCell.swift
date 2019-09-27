//
//  BaseTodayCell.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 08/08/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class BaseTodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
