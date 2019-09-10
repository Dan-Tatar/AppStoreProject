//
//  BackEnabledNavigationController.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 02/09/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class BackEnabledNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

       self.interactivePopGestureRecognizer?.delegate = self
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}

