//
//  AppsController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 10/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit



class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var editorChoice: AppGroup?
    
    private let reuseIdentifier = "CellID"
    private let headerCell = "headerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView!.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCell)
        collectionView.backgroundColor = .white
        
        Service.shared.fetchApps { (res, err)  in
            if let err = err {
                print("Failed to load data", err)
            }
            DispatchQueue.main.async {
                print(res?.feed.title)
              self.editorChoice = res
                print("dani is\(self.editorChoice?.feed.title)")
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCell, for: indexPath) as! AppsPageHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsGroupCell
    
            cell.titleLabel.text = editorChoice?.feed.title
            cell.horizontalController.appGroup = editorChoice
            cell.horizontalController.collectionView.reloadData()
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
}
