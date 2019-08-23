//
//  TodayMultipleAppsController.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 12/08/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class TodayMultipleAppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let multipleAppsCellID = "multipleAppsCellID"
    
    var closeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        button.tintColor = .darkGray

        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    var results = [FeedResult]()
    
    override func viewDidLoad() {
        
        if mode == .fullscreen {
             setupCloseButton()
        }
        
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.register(MultipleAppsCell.self, forCellWithReuseIdentifier: multipleAppsCellID)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
       
    }
    
    func setupCloseButton() {
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(closeButton)
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 38).isActive = true
    }
    
    @objc func closeAction() {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleAppsCellID, for: indexPath) as? MultipleAppsCell
        cell?.app = results[indexPath.row]
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4, results.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = (view.frame.height - 3 * spacing) / 4
        return .init(width: view.frame.width, height: height)
    }
    
    fileprivate let spacing: CGFloat = 18
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    fileprivate let mode: Mode
    
    enum Mode {
        case small, fullscreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
