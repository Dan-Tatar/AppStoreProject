//
//  BaseTodayCell.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 08/08/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class BaseTodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem!
    
    override var isHighlighted: Bool {
        
        didSet {
            if isHighlighted {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.transform = .init(scaleX: 0.9, y: 0.9)
            })
             
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.transform = .identity
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
