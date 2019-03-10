//
//  BaseTabBarController.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 26/02/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class BaseTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        
        viewControllers = [createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
                           createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
                           createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps")
                          ]
    }
    // Function that creates navigation controllers to be added to the viewControllers array
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.view.backgroundColor = UIColor.white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
