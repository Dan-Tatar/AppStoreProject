//
//  ScreenshotCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 03/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    var screenshot: String! {
        didSet {
            screenshotImage.sd_setImage(with: URL(string: screenshot))
        }
    }
 
    let screenshotImage = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        
        addSubview(screenshotImage)
    
        screenshotImage.translatesAutoresizingMaskIntoConstraints = false
        screenshotImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        screenshotImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        screenshotImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        screenshotImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
