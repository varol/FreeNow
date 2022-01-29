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
    
    fileprivate func setupViewControllers() {
        
        let vehicleVC = VehicleListViewController()
        vehicleVC.viewModel = VehicleListViewModel(networkManager: NetworkManager())
        let firstItem = createNavController(for: vehicleVC,
                                       title: NSLocalizedString(Constants.vehicleListTitle, comment: ""),
                                       image: UIImage(systemName: Constants.vehicleListIcon)!)
        let mapVC = MapViewController()
        mapVC.viewModel = MapViewModel(networkManager: NetworkManager())
        let secondItem = createNavController(for: mapVC,
                                                            title: NSLocalizedString(Constants.mapTitle, comment: ""),
                                                            image: UIImage(systemName: Constants.mapIcon)!)

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
