//
//  SplashViewController.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigateToVehicleListScreen()
    }

    fileprivate func navigateToVehicleListScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let tabBar = MainTabbarController()
            tabBar.modalPresentationStyle = .fullScreen
            self.navigationController?.present(tabBar, animated: true, completion: nil)
        }
    }
}
