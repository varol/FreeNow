//
//  SplashViewController.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit

final class SplashViewController: BaseViewController {

    var viewModel: SplashViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func prepareSplashView() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func navigateToVehicleListScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let tabBar = MainTabbarController()
            tabBar.modalPresentationStyle = .fullScreen
            self.navigationController?.present(tabBar, animated: true, completion: nil)
        }
    }
}
