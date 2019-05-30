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
    let reviewsCell = "reviewsCell"
    
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
            let reviewsURL = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
            Service.shared.fetchGenericJSONData(urlString: reviewsURL) { (reviews: Reviews?, err) in
             
                
                self.reviews = reviews
                
                if let err = err {
                    print("Failed to decode reviews", err)
                }
                
                let reviews = reviews?.feed.entry.forEach({ (entry) in
                    print("\(entry.ratiing.label))")
                })
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                }
            }
        }
    }
    
    var app: Results?
    var reviews: Reviews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCell)
        collectionView.register(ReviewsCell.self, forCellWithReuseIdentifier: reviewsCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCell, for: indexPath) as! PreviewCell
            cell.previewCollectionView.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewsCell, for: indexPath) as! ReviewsCell
            cell.reivewsController.reviews = self.reviews
          
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
        } else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 500)
        
        } else {
            return .init(width: view.frame.width, height: 200)
        }
     
    }
}
