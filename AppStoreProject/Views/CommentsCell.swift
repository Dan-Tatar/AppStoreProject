//
//  CommentsCell.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 06/05/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class CommentsCell: UICollectionViewCell {
    
    
    var reviews: Entry! {
        didSet {
            titleLabel.text = reviews.title.label
        }
    }
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
//    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let bodyLabel = UILabel(text: "Review body", font: .systemFont(ofSize: 14))
    let startStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            arrangedSubviews.append(imageView)
        })
        arrangedSubviews.append(UIView())
    
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      backgroundColor = #colorLiteral(red: 0.9253996015, green: 0.9255363345, blue: 0.9253810048, alpha: 1)
      layer.cornerRadius = 16
      clipsToBounds = true
      bodyLabel.numberOfLines = 0
        
      let stackView = VerticalStackView(arrangedSubviews:
        [UIStackView(arrangedSubviews:
                     [titleLabel,
                      authorLabel], customSpacing: 8),
        startStackView,
        bodyLabel], spacing: 12)

        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false


        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        stackView.backgroundColor = .black
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
