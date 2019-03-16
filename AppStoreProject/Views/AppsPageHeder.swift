//
//  AppsPageHeder.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 15/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    var headerCollectionView = AppHeaderCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerCollectionView.view)
        
        headerCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        headerCollectionView.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        headerCollectionView.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        headerCollectionView.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        headerCollectionView.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
