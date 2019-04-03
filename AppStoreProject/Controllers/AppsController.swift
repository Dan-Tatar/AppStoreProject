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
    var headerData = [SocialApps]()
    fileprivate var group = [AppGroup]()
    
    private let reuseIdentifier = "CellID"
    private let headerCell = "headerCell"
    
    let activityIndicator: UIActivityIndicatorView = {
    let aI = UIActivityIndicatorView(style: .whiteLarge)
        aI.color = .black

        return aI
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView!.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCell)
        collectionView.backgroundColor = .white
        view.addSubview(activityIndicator)
         activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        fetchData()
        
        activityIndicator.startAnimating()
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 44).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
//    let cell = AppsGroupCell()
    fileprivate func fetchData() {
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        // Uses Dispatch group allow syncronization of the multiple fetch requests displayed in the collectionView
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchHeaderData(completion: { (apps, err) in
            dispatchGroup.leave()
            if let err = err {
                print ("Error is \(err)" )
            }
            apps?.forEach({ print($0.name)})
            if let apps = apps {
                self.headerData = apps
            }
            
        })
        
        dispatchGroup.enter()
        Service.shared.fetchNewApps { (res, err)  in
            
            dispatchGroup.leave()
            if let err = err {
                print("Failed to load data", err)
            }
            group1 = res
        }
       
        dispatchGroup.enter()
        Service.shared.fetchTopGrossingApps { (res, err) in
            dispatchGroup.leave()
            if let err = err {
                print(err)
            }
           group2 = res
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopFreeApps { (res, err) in
            dispatchGroup.leave()
            if let err = err {
                print(err)
            }
           group3 = res
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Fetch has been completed...")
            if let group1 = group1 {
                self.group.append(group1)
            }
            if let group2 = group2 {
                self.group.append(group2)
            }
            if let group3 = group3 {
                self.group.append(group3)
            }
            self.activityIndicator.stopAnimating()

            self.collectionView.reloadData()
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
        header.headerCollectionView.socialApps = headerData
        header.headerCollectionView.collectionView.reloadData()
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
