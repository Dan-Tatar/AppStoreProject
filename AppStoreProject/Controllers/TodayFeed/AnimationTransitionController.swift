//
//  AnimationTransitionController.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 12/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AnimationTransitionController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = TodayCell()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }
    
}
