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
    var group = [AppGroup]()
    
    private let reuseIdentifier = "CellID"
    private let headerCell = "headerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView!.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCell)
        collectionView.backgroundColor = .white
        
        fetchData()
    }
    
    func fetchData() {
    
        Service.shared.fetchNewApps { (res, err)  in
            if let err = err {
                print("Failed to load data", err)
            }
            
            if let appResult = res {
                self.group.append(appResult)
                
            }
            DispatchQueue.main.async {
                print("1")
                self.collectionView.reloadData()
            }
        }
        // Ferch request
        Service.shared.fetchTopGrossingApps(completion: { (res, err) in
            if let err = err {
                print(err)
            }
            if let appResult = res {
                self.group.append(appResult)
            }
            DispatchQueue.main.async {
                print("dani is\(self.editorChoice?.feed.title)")
                print("2")
                self.collectionView.reloadData()
            }
        })
        
        Service.shared.fetchTopFreeApps { (res, err) in
            
            if let err = err {
                print(err)
            }
            if let appResult = res {
                self.group.append(appResult)
            }
            DispatchQueue.main.async {
                print("3")
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return group.count
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
        
            cell.titleLabel.text = group[indexPath.item].feed.title
            cell.horizontalController.appGroup = group[indexPath.row]
            cell.horizontalController.collectionView.reloadData()
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
}
