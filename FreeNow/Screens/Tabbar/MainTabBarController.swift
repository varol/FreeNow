//
//  MainTabBarController.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit

extension MainTabbarController {
    fileprivate enum Constants {
        static let vehicleListTitle: String = "Vehicle List"
        static let vehicleListIcon: String = "house"
        static let mapTitle: String = "Map"
        static let mapIcon: String = "location"
    }
}

final class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewControllers()
    }
    
    private func setupViewControllers() {

        viewControllers = [
            createNavController(for: VehicleListViewController(),
                                   title: NSLocalizedString(Constants.vehicleListTitle, comment: ""),
                                   image: UIImage(systemName: Constants.vehicleListIcon)!),
            createNavController(for: MapViewController(),
                                   title: NSLocalizedString(Constants.mapTitle, comment: ""),
                                   image: UIImage(systemName: Constants.mapIcon)!)
        ]
    }
        
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
    }
}
