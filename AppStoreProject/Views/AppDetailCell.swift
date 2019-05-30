//
//  AppDetailCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 13/04/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    var app: Results! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appImage.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    var appImage = UIImageView(cornerRadius: 8)
    
    var nameLabel = UILabel(text: "App Name", font: UIFont.boldSystemFont(ofSize: 20))
    
    let descriptionLabel = UILabel(text: "Description", font: UIFont.systemFont(ofSize: 14))
    
    let whatsNewLabel = UILabel(text: "What's new", font: UIFont.boldSystemFont(ofSize: 20))
    
    let releaseNotesLabel = UILabel(text: "Release notes", font: UIFont.systemFont(ofSize: 14))
    
    let priceButton = UIButton(title: "Get")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        priceButton.layer.cornerRadius = 15
        priceButton.backgroundColor = .blue
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        priceButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        appImage.backgroundColor = UIColor.blue
        appImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        appImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        releaseNotesLabel.numberOfLines = 0
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                        appImage,
                        VerticalStackView(arrangedSubviews: [nameLabel,
                                                             descriptionLabel,
                                                             UIStackView(arrangedSubviews: [priceButton
                                                                ,UIView()])], spacing: 0)], customSpacing: 16),
            whatsNewLabel,
            releaseNotesLabel], spacing: 16)
    
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
      
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews:  arrangedSubviews)
        self.spacing = customSpacing
    }
}
