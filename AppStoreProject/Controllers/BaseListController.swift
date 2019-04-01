//
//  BaseListController.swift
//  
//
//  Created by Dan  Tatar on 10/03/2019.
//

import UIKit


class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
