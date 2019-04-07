//
//  AppsGroupCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 10/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    
    let titleLabel = UILabel(text: "App Selection", font: UIFont.boldSystemFont(ofSize: 24))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(horizontalController.view)
        addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        horizontalController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        horizontalController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        horizontalController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
