//
//  BaseListController.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 11/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
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
