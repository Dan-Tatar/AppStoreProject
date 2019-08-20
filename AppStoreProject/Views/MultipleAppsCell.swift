//
//  MultipleAppsCell.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 12/08/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class MultipleAppsCell: UICollectionViewCell {
    
    var app: FeedResult! {
        didSet {
            imageView.sd_setImage(with: URL(string: app.artworkUrl100), completed: nil)
            namelLabel.text = app.name
            companyLabel.text = app.artistName
        }
    }
    
    let imageView = UIImageView(cornerRadius: 8)
    let namelLabel = UILabel(text: "App name", font: UIFont.boldSystemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company name", font: UIFont.systemFont(ofSize: 13))
    let getButton = UIButton(title: "Get")
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .green
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews: [namelLabel, companyLabel], spacing: 4), getButton])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
