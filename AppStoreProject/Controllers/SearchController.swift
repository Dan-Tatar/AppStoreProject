//
//  SearchController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 27/02/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "cellID"
    fileprivate var appResults = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: cellID)
        fetchITunesData()
    }
    
    fileprivate func fetchITunesData() {
        
        let urLString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urLString) else { return}
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            
            if let error = error {
                print("Failed to fetch Apps", error)
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(SearchResult.self, from: data)
                searchResult.results.forEach( { print($0.trackName, $0.primaryGenreName)} )
                
                self.appResults = searchResult.results
                DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
                
            } catch let jsonError {
                print("Failed to decode json", jsonError)
            }
            }.resume()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultsCell
        let appResult = appResults[indexPath.row]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingLabel.text = "Rating \(appResult.averageUserRating ?? 0)" 
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
