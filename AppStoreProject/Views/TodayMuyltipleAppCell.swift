//
//  TodayMuyltipleAppCell.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 08/08/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit


class TodayMultipleAppCell: BaseTodayCell {
    
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLab.text = todayItem.title
            
            multipleAppsController.results = todayItem.apps
            multipleAppsController.collectionView.reloadData()
        }
    }
    let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    let titleLab = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 26))
    
    let multipleAppsController = TodayMultipleAppsController(mode: .small)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowOffset = .init(width: 0, height: 10)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            categoryLabel,
            titleLab,
            multipleAppsController.view
            ], spacing: 12)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        
        titleLab.numberOfLines = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
