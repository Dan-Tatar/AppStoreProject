//
//  TodayMultipleAppsController.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 12/08/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class TodayMultipleAppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let multipleAppsCellID = "multipleAppsCellID"
    override func viewDidLoad() {
        
        collectionView.backgroundColor = .white
        collectionView.register(MultipleAppsCell.self, forCellWithReuseIdentifier: multipleAppsCellID)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleAppsCellID, for: indexPath) as? MultipleAppsCell
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 58)
    }
   
}
