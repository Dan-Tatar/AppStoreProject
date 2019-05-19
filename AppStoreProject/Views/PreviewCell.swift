//
//  Preview ell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 02/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    let previewCollectionView = PreviewHorizontalController()
    let previewLabel = UILabel(text: "Preview", font: UIFont.boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewCollectionView.view)
        addSubview(previewLabel)
        previewCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        

        previewCollectionView.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        previewCollectionView.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        previewCollectionView.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        previewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        previewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        previewLabel.bottomAnchor.constraint(equalTo: previewCollectionView.view.topAnchor, constant: -8).isActive = true
        previewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
