//
//  SearchController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 27/02/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "cellID"
    fileprivate var appResults = [Results]()

    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
    var searchLabel: UILabel = {
        let sl = UILabel()
        sl.text = "Please enter searched text"
        sl.font = UIFont.systemFont(ofSize: 20)
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: cellID)
        
        setupSearchBar()
        collectionView.addSubview(searchLabel)
        
        searchLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        searchLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100).isActive = true
//        fetchItunesApp()
    }
    
    //Setting the properties for search bur as well as adding the delegate to notify the viewcontroller when changes are made
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
    var timer: Timer?
    
    //Notifies when text changes in the searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
        Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
            if let err = err {
                print("There is an error" , err)
            }
          
            self.appResults = res?.results ?? []
            
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
        
    func fetchItunesApp() {
        
        Service.shared.fetchApps(searchTerm: "Twitter") { (res, err)  in
            if let err = err {
                print("There is a fetch error \(err)")
            }
            self.appResults = res?.results ?? []
            DispatchQueue.main.async {
                 self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultsCell
        let appResult = appResults[indexPath.row]
        cell.appResult = appResult

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchLabel.isHidden = appResults.count != 0

        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
