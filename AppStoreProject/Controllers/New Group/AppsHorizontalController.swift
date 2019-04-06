//
//  HorizontalController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 11/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
  
    var appGroup: AppGroup?
    
    private let reuseIdentifier = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(AppsHorizontalCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        if let layout = collectionViewLayout  as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
       
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return appGroup?.feed.results.count ?? 0
    }
    
    var lineSpacing: CGFloat = 10
    var topBottomPadding: CGFloat = 12
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing - 16) / 3
        let width: CGFloat = 16 + 16
        return CGSize(width: view.frame.width - width - 20, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)  as! AppsHorizontalCell
        
        let app = appGroup?.feed.results[indexPath.row]
        cell.namelLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
