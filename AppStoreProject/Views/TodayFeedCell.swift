//
//  TodayFeedCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 07/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    let titleLab = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 26))
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way", font: .systemFont(ofSize: 16))
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLab.text = todayItem.title
            imageView.image = todayItem.image
            descriptionLabel.text = todayItem.description
            backgroundColor = todayItem.backgroundColor
        }
    }
    var topConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        descriptionLabel.numberOfLines = 3
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        
        let stackView = VerticalStackView(arrangedSubviews: [categoryLabel, titleLab, imageContainerView, descriptionLabel], spacing: 8)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
