//
//  ExtensionUILabel.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 11/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String , font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}
