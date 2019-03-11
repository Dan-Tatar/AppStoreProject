//
//  AppsController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 10/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit



class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView.backgroundColor = .yellow
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsGroupCell
    
        return cell
    }

}
