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
    
    var results = [FeedResult]()
    override func viewDidLoad() {
        
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.register(MultipleAppsCell.self, forCellWithReuseIdentifier: multipleAppsCellID)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        Service.shared.fetchTopFreeApps { (results, err) in
            
            if let err = err {
                print(err)
            }
            self.results = results?.feed.results ?? []
     
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleAppsCellID, for: indexPath) as? MultipleAppsCell
        cell?.app = results[indexPath.row]
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4, results.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 58)
    }
    
    fileprivate let spacing: CGFloat = 16
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
   
}
