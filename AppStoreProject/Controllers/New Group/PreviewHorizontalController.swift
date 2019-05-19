//
//  PreviewHorizontalController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 02/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class PreviewHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = "cellIdentifier"
    
    var app: Results? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        if let layout = collectionViewLayout  as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ScreenshotCell
        if let app = app {
            let screenshotUrl = app.screenshotUrls[indexPath.item]
        cell.screenshot = screenshotUrl
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return .init(width: 260, height: view.frame.height)
    }
}
