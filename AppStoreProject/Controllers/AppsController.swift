//
//  AppsController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 10/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit



class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "CellID"
    
//    var titleLabel = UILabel(text: "App Selection", font: UIFont.systemFont(ofSize: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(AppsGroupCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        collectionView.backgroundColor = .yellow
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsGroupCell
//        cell.backgroundColor = .blue
        // Configure the cell
    
        return cell
    }

//    func setupViews() {
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.addSubview(titleLabel)
//        titleLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 10).isActive = true
//        titleLabel.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 10).isActive = true
//    }

}
