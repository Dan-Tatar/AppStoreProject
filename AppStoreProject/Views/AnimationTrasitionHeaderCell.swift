//
//  AnimationTrasitionHeaderCell.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 18/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AppTransitionHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       addSubview(todayCell)
        addSubview(closeButton)
        
        todayCell.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        todayCell.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        todayCell.heightAnchor.constraint(equalToConstant: 250).isActive = true
        todayCell.widthAnchor.constraint(equalToConstant: 250).isActive = true
        todayCell.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 38).isActive = true
        closeButton.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
