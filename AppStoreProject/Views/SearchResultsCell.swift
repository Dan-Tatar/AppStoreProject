//
//  SearchResultsCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 27/02/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class SearchResultsCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let nl = UILabel()
        nl.text = "APP NAME"
        nl.backgroundColor = .green
        return nl
    }()
    
    let categoryLabel: UILabel = {
        let nl = UILabel()
        nl.text = "Photos % Video"
        return nl
    }()
    
    let ratingLabel: UILabel = {
        let nl = UILabel()
        nl.text = "9.26M"
        nl.backgroundColor = .green
        return nl
    }()
    
    let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenShotImageView = self.createScreenshotImageView()
    lazy var screenShot2ImageView = self.createScreenshotImageView()
    lazy var screenShot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor =  .blue
        return imageView
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        labelsStackView.axis = .vertical
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
       
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenShotImageView, screenShot2ImageView, screenShot3ImageView])
        screenShotsStackView.spacing = 12
        screenShotsStackView.distribution = .fillEqually
        screenShotsStackView.axis = .horizontal
        
        let overallStackView = UIStackView(arrangedSubviews: [infoTopStackView, screenShotsStackView])
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        
        addSubview(overallStackView)
        overallStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
