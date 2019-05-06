//
//  CommentsCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 06/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class CommentsCell: UICollectionViewCell {
    
    let reivewsController = ReviewsController()
    override init(frame: CGRect) {
        super.init(frame: frame)
     
      backgroundColor = #colorLiteral(red: 0.9253996015, green: 0.9255363345, blue: 0.9253810048, alpha: 1)
      layer.cornerRadius = 16
      clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
