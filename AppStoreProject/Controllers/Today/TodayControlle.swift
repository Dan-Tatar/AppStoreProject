//
//  TodayControlle.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 07/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit


class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    let items = [
        TodayItem(category: "THE DAILY LIST", title: "Test Drive These Car Play Apps", image: #imageLiteral(resourceName: "holiday"), description: "", backgroundColor: .white, cellType: .multiple),
        TodayItem(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize your life the right way", backgroundColor: .white, cellType: .single),
        TodayItem(category: "HOLIDAYS", title: "Travel on a budget" , image: #imageLiteral(resourceName: "holiday"), description: "Find out all you need to know on how to travel without packing everything", backgroundColor: #colorLiteral(red: 0.982188642, green: 0.9636412263, blue: 0.7271445394, alpha: 1), cellType: .single)
    ]
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellId = items[indexPath.row].cellType.rawValue
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseTodayCell
        
        cell.todayItem = items[indexPath.row]

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    var animationTransitionController: UITableViewController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let animationTransitionController = AnimationTransitionController()
        animationTransitionController.todayItem = items[indexPath.row]
        animationTransitionController.dismissHandler = {
            self.handleRemoveRedView()
        }
        animationTransitionController.view.backgroundColor = .white
        
        let fullScreenView = animationTransitionController.view!

        fullScreenView.layer.cornerRadius = 16
        
        self.collectionView.isUserInteractionEnabled = false
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
       
        // absolute coordinate of frame
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
//        redView.frame = startingFrame
        view.addSubview(fullScreenView)
        
        // calling this for the view to render itself and call the methods from animationTransitionController
        addChild(animationTransitionController)
        
        self.animationTransitionController = animationTransitionController
        
        self.startingFrame = startingFrame
        
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            
            guard let cell = self.animationTransitionController.tableView.cellForRow(at: [0, 0]) as? AppTransitionHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    var startingFrame: CGRect?
    
    @objc func handleRemoveRedView() {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
           
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 0)
            
            guard let cell = self.animationTransitionController.tableView.cellForRow(at: [0, 0]) as? AppTransitionHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 24
            cell.layoutIfNeeded()
            
        }, completion: { _ in
            self.animationTransitionController.view.removeFromSuperview()
            self.animationTransitionController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
           }
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
