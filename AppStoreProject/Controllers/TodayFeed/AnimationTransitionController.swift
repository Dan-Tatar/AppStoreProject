//
//  AnimationTransitionController.swift
//  AppStoreProject
//
//  Created by Dan Tatar on 12/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit

class AnimationTransitionController: UITableViewController {

    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = UITableViewCell()
            let todayCell = TodayCell()
            cell.addSubview(todayCell)
            todayCell.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            todayCell.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            todayCell.heightAnchor.constraint(equalToConstant: 250).isActive = true
            todayCell.widthAnchor.constraint(equalToConstant: 250).isActive = true
            todayCell.translatesAutoresizingMaskIntoConstraints = false
            
            
            return cell
            
        }
            let cell = AnimationTransitionDescriptionCell()
            
            return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
