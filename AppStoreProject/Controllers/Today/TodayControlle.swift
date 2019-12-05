//
//  TodayControlle.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 07/07/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import UIKit


class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var items = [TodayItem]()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        var aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.startAnimating()
        aiv.color = .darkGray
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    var topFreeApps: AppGroup?
    var topGroosingApps: AppGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        activityIndicatorView.startAnimating()
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
        
        fetchData()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.superview?.setNeedsLayout()
    }
    
    func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTopFreeApps { (appGroup, err) in
            self.topFreeApps = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossingApps { (appGroup, err) in
            self.topGroosingApps = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Finished fetching")
            self.activityIndicatorView.stopAnimating()
            self.items = [
                TodayItem(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize your life the right way", backgroundColor: .white, cellType: .single, apps:  []),
                TodayItem(category: "THE DAILY LIST", title: self.topGroosingApps?.feed.title ?? "", image: #imageLiteral(resourceName: "holiday"), description: "", backgroundColor: .white, cellType: .multiple, apps: self.topGroosingApps?.feed.results ?? []),
                TodayItem(category: "THE DAILY LIST", title: self.topFreeApps?.feed.title ?? "" , image: #imageLiteral(resourceName: "holiday"), description: "", backgroundColor: .white, cellType: .multiple, apps:  self.topFreeApps?.feed.results ?? [])
            ]
            self.collectionView.reloadData()
        }
    }
    
    func setupView() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    var animationTransitionController: UITableViewController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    
    
    fileprivate func showDailyListFullScreen(_ indexPath: IndexPath) {
        let fullController = TodayMultipleAppsController(mode: .fullscreen)
        fullController.results = items[indexPath.item].apps
        let navigationController = BackEnabledNavigationController(rootViewController: fullController)
        present(navigationController, animated: true)
        return
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch items[indexPath.item].cellType {
        case .multiple:
            showDailyListFullScreen(indexPath)
            return
        default:
            showSingleAppFullScreen(indexPath: indexPath)
        }
    }
    
    fileprivate func setupSingleAppFullscreenController(_ indexPath: IndexPath) {
        
        let animationTransitionController = AnimationTransitionController()
        animationTransitionController.todayItem = items[indexPath.row]
        animationTransitionController.dismissHandler = {
            self.handleRemoveRedView()
        }
        animationTransitionController.view.layer.cornerRadius = 16
        animationTransitionController.view.backgroundColor = .white
        self.animationTransitionController = animationTransitionController
    }
    
    fileprivate func setupStatingFrame(_ indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return}
        
             // absolute coordinate of frame
             guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
             //        redView.frame = startingFrame
             
             self.startingFrame = startingFrame
    }
    
    fileprivate func setupAppFullScreenStartingPosition(_ indexPath: IndexPath) {
        
        let fullScreenView = animationTransitionController.view!
        
        self.collectionView.isUserInteractionEnabled = false
    
        view.addSubview(fullScreenView)
        
        // calling this for the view to render itself and call the methods from animationTransitionController
        addChild(animationTransitionController)
        
        setupStatingFrame(indexPath)
        
        guard let startingFrame = startingFrame else { return }
        
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
          
    }
    
    fileprivate func beginFullScreenAnimation() {
        
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
    
    fileprivate func showSingleAppFullScreen(indexPath: IndexPath) {
        
        setupSingleAppFullscreenController(indexPath)
        
        // setup fullscreen in its original for its starting position
        setupAppFullScreenStartingPosition(indexPath)
        
        
        //begin fullscreen animation
        beginFullScreenAnimation()

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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = items[indexPath.row].cellType.rawValue
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseTodayCell
        
        cell.todayItem = items[indexPath.row]
        
        (cell as? TodayMultipleAppCell)?.multipleAppsController.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMultipleAppsTap)))
        
        return cell
    }
    
    @objc func handleMultipleAppsTap(gesture: UIGestureRecognizer) {
        
        let collectionView = gesture.view
        
        var superview = collectionView?.superview
        
        while superview != nil {
            if let cell = superview as? TodayMultipleAppCell {
                
                guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
                
                let apps = self.items[indexPath.item].apps
                
                let fullController = TodayMultipleAppsController(mode: .fullscreen)
                fullController.results = apps
                present(BackEnabledNavigationController(rootViewController: fullController) , animated: true)
                return
            }
            superview = superview?.superview
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
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
