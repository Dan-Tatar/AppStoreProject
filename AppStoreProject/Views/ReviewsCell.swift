//
//  ReviewsCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 06/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class ReviewsCell: UICollectionViewCell {
    
    let reivewsController = ReviewsController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubview(reivewsController.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
