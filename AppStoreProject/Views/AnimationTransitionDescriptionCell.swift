//
//  AppTransitionDescriptionCell.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 12/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit


class AnimationTransitionDescriptionCell: UITableViewCell {
    
    let labelDescription: UILabel = {
        
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Great games", attributes: [.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: " are all about the details, from subtle visual effects to imaginative art styles. In these titles, you're sure to find something to marvel at, whether you're into fantasy worlds or neon-soaked dartboards.", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nHeroic adventure", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nBattle in dungeons. Collect treasure. Solve puzzles. Sail to new lands. Oceanhorn lets you do it all in a beautifully detailed world.", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nHeroic adventure", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nBattle in dungeons. Collect treasure. Solve puzzles. Sail to new lands. Oceanhorn lets you do it all in a beautifully detailed world.", attributes: [.foregroundColor: UIColor.gray]))
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(labelDescription)
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        labelDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        labelDescription.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        labelDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        labelDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
