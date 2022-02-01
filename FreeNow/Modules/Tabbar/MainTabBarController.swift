//
//  MainTabBarController.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit
import FreeNowCoreAPI

extension MainTabbarController {
    fileprivate enum Constants {
        static let vehicleListTitle: String = "Vehicle List"
        static let vehicleListIcon: String = "listIcon"
        static let mapTitle: String = "Map"
        static let carIcon: String = "carIcon"
    }
}

final class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        
        let vehicleVC = VehicleListViewController()
        vehicleVC.viewModel = VehicleListViewModel()
        let firstItem = createNavController(for: vehicleVC,
                                       title: NSLocalizedString(Constants.vehicleListTitle, comment: ""),
                                       image: UIImage(named: Constants.vehicleListIcon)!)
        
        let mapVC = MapViewController()
        mapVC.viewModel = MapViewModel()
        let secondItem = createNavController(for: mapVC,
                                                            title: NSLocalizedString(Constants.mapTitle, comment: ""),
                                                            image: UIImage(named: Constants.carIcon)!)

        viewControllers = [
            firstItem, secondItem
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
    
    fileprivate func setupUI() {
        view.backgroundColor = .darkGray
        
        UITabBar.appearance().barTintColor = .darkGray
        tabBar.tintColor = .white
        tabBar.backgroundColor = .darkGray
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .darkGray
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().prefersLargeTitles = false
        }
    }
}
