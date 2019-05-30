//
//  HeaderCollectionCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 15/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppHeaderCollectionCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: UIFont.systemFont(ofSize: 12))
    
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: UIFont.systemFont(ofSize: 26))
    let imageView = UIImageView(cornerRadius: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let stackView = VerticalStackView(arrangedSubviews:
            [companyLabel,
             titleLabel,
             imageView], spacing: 8)
    
        companyLabel.textColor = .blue
        titleLabel.numberOfLines = 2
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        imageView.backgroundColor = .red
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
