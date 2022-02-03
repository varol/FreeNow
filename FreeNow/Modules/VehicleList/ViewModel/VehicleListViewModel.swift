//
//  VehicleListViewModel.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation

extension VehicleListViewModel {
    fileprivate enum Constants {
        enum Coordinates {
            static let hamburgCoordinates: VehiclesRequestModel = VehiclesRequestModel(p1Lat: "53.694865",
                                                                                       p1Lon: "9.757589",
                                                                                       p2Lat: "53.394655",
                                                                                       p2Lon: "10.099891")
        }
        
        enum UI {
            static let heightDimension: Double = 177
        }
    }
}

@objc protocol VehicleListViewModelProtocol: NSObjectProtocol {
    @objc var delegate: VehicleListViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var heightDimension: Double { get }
    
    @objc func load()
    @objc func vehicles(_ index: Int) -> Vehicle?
    @objc func pullToRefresh()
}

@objc public protocol VehicleListViewModelDelegate: NSObjectProtocol {
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
    func prepareCollectionView()
    func addRefreshControl()
}

@objcMembers
final class VehicleListViewModel: NSObject {
    private var vehicles: [Vehicle] = []
    var apiService: APIServiceProtocol
    @objc weak var delegate: VehicleListViewModelDelegate?

    @objc public init(_ apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    internal func fetchVehicles(_ coordinates: VehiclesRequestModel = Constants.Coordinates.hamburgCoordinates) {
        self.apiService.fetchVehicles(coordinates: coordinates) {[weak self] vehicles, apiError in
            guard let self = self else { return }
            self.handleVehicleResult(vehicles: vehicles, error: apiError)
        }
    }
    
    internal func handleVehicleResult(vehicles: [Vehicle]?, error: NSError?) {
        self.delegate?.hideLoadingView()
        if let vehicles = vehicles {
            self.vehicles = vehicles
            self.delegate?.reloadData()
        } else if let error = error {
            print(error)
        }
    }
}

extension VehicleListViewModel: VehicleListViewModelProtocol {
    var heightDimension: Double {
        Constants.UI.heightDimension
    }

    var numberOfItems: Int {
        vehicles.count
    }
    
    @objc func load() {
        delegate?.prepareCollectionView()
        delegate?.addRefreshControl()
        delegate?.showLoadingView()
        fetchVehicles()
    }
    
    func vehicles(_ index: Int) -> Vehicle? {
        vehicles[safe: index]
    }
    
    func pullToRefresh() {
        fetchVehicles()
    }
}
