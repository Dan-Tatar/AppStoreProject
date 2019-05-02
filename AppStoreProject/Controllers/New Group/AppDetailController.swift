//
//  AppDetailController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 13/04/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let detailCellId = "DetailCellId"
    let previewCell = "previewCell"
    
    var appId: String! {
        didSet {
           
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                     self.collectionView.reloadData()
                }
            }
        }
    }
    
    var app: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
        cell.app = app
        return cell
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCell, for: indexPath) as! PreviewCell
        return cell
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
        let dummyCell =  AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        dummyCell.app = app
        
        dummyCell.layoutIfNeeded()
        dummyCell.releaseNotesLabel.text = app?.releaseNotes
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        return .init(width: view.frame.width, height: estimatedSize.height)
        } else {
 return .init(width: view.frame.width, height: 500)
        }
    }
    
}
