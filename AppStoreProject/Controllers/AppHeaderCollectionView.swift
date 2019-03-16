//
//  HeaderCollectionsView.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 15/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppHeaderCollectionView: BaseListController {
    
    private var reusableCell = "reusableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .yellow
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableCell)
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//           layout.scrollDirection = .horizontal
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCell, for: indexPath)
        
        cell.backgroundColor = .red
        return cell
    }
}
