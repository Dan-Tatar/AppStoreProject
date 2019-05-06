//
//  ReviewsController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 06/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class ReviewsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = "cellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CommentsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.backgroundColor = .white
        if let layout = collectionViewLayout  as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CommentsCell
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
}
