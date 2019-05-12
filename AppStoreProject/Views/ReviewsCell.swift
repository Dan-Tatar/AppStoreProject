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

        addSubview(reivewsController.view)
        
        reivewsController.view.translatesAutoresizingMaskIntoConstraints = false
        
        reivewsController.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        reivewsController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        reivewsController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 12).isActive = true
        reivewsController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 12).isActive = true
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
