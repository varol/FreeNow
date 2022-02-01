//
//  SplashViewModel.swift
//  FreeNow
//
//  Created by Varol Aksoy on 31.01.2022.
//

import FreeNowCoreAPI

protocol SplashViewModelProtocol {
    var delegate: SplashViewModelDelegate? { get set }

    func load()
}

protocol SplashViewModelDelegate: AnyObject {
    func prepareSplashView()
    func navigateToVehicleListScreen()
}

final class SplashViewModel: BaseViewModel {
    weak var delegate: SplashViewModelDelegate?
}

extension SplashViewModel: SplashViewModelProtocol {
    func load() {
        delegate?.prepareSplashView()
        delegate?.navigateToVehicleListScreen()
    }
}
