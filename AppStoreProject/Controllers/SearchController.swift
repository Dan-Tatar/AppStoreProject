//
//  SearchController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 27/02/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit
import SDWebImage

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "cellID"
    fileprivate var appResults = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: cellID)
        
        fetchItunesApp()
    }
    
    func fetchItunesApp() {
        
        Service.shared.fetchApps() { (results, err)  in
            if let err = err {
                print("There is a fetch error \(err)")
            }
            self.appResults = results
            DispatchQueue.main.async {
                 self.collectionView.reloadData()
            }
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultsCell
        let appResult = appResults[indexPath.row]
        cell.appResult = appResult

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
