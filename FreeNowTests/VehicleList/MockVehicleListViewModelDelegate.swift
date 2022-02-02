//
//  MockVehicleListViewModelDelegate.swift
//  FreeNowTests
//
//  Created by Varol Aksoy on 31.01.2022.
//

@testable import FreeNow

final class MockVehicleListViewModelDelegate: VehicleListViewModelDelegate {

    var invokedShowLoadingView = false
    var invokedShowLoadingViewCount = 0

    func showLoadingView() {
        invokedShowLoadingView = true
        invokedShowLoadingViewCount += 1
    }

    var invokedHideLoadingView = false
    var invokedHideLoadingViewCount = 0

    func hideLoadingView() {
        invokedHideLoadingView = true
        invokedHideLoadingViewCount += 1
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedPrepareCollectionView = false
    var invokedPrepareCollectionViewCount = 0

    func prepareCollectionView() {
        invokedPrepareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }

    var invokedAddRefreshControl = false
    var invokedAddRefreshControlCount = 0

    func addRefreshControl() {
        invokedAddRefreshControl = true
        invokedAddRefreshControlCount += 1
    }
}
