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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(previewCollectionView.view)
        
        previewCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        previewCollectionView.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        previewCollectionView.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        previewCollectionView.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        previewCollectionView.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
