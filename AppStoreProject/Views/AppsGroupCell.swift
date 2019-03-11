//
//  AppsGroupCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 10/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    
    
    var titleLabel = UILabel(text: "App Selection", font: UIFont.systemFont(ofSize: 30))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
