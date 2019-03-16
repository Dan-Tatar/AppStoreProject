//
//  HeaderCollectionsView.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 15/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppHeaderCollectionView: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private var reusableCell = "reusableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         collectionView.backgroundColor = . white
        collectionView.register(AppHeaderCollectionCell.self, forCellWithReuseIdentifier: reusableCell)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
           layout.scrollDirection = .horizontal
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 44, height: view.frame.height - 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCell, for: indexPath) as! AppHeaderCollectionCell
        
        return cell
    }
}
