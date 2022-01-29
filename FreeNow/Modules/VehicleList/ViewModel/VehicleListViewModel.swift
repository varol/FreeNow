//
//  VehicleListViewModel.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation
import FreeNowCoreAPI

extension VehicleListViewModel {
    fileprivate enum Constants {
        enum Coordinates {
            static let hamburgCoordinates: VehiclesRequestModel = VehiclesRequestModel(p1Lat: "53.694865",
                                                                                       p1Lon: "9.757589",
                                                                                       p2Lat: "53.394655",
                                                                                       p2Lon: "10.099891")
        }
        
        enum UI {
            static let cellPadding: Double = 16
            static let widthDimension: Double = 1
            static let heightDimension: Double = 44
            static let layoutGroupCount: Int = 1
        }
    }
}

protocol VehicleListViewModelProtocol {
    var delegate: VehicleListViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    var cellPadding: Double { get }
    var widthDimension: Double { get }
    var heightDimension: Double { get }
    var layoutGroupCount: Int { get }
    
    func load()
    func vehicles(_ index: Int) -> Vehicle?
    func pullToRefresh()
}

protocol VehicleListViewModelDelegate: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func reloadData()
    func endRefreshing()
    func prepareCollectionView()
    func addRefreshControl()
}

final class VehicleListViewModel: BaseViewModel {
    private var vehicles: [Vehicle] = []
    let networkManager: NetworkManager<VehiclesEndpointItem>
    weak var delegate: VehicleListViewModelDelegate?

    init(networkManager: NetworkManager<VehiclesEndpointItem>) {
        self.networkManager = networkManager
    }
    
    fileprivate func fetchVehicles(_ coordinates: VehiclesRequestModel = Constants.Coordinates.hamburgCoordinates) {
        
        networkManager.request(endpoint: .spesificLocation(coordinates),
                               type: VehiclesResponse.self) {[weak self] result in
            
            guard let self = self else { return }
            self.delegate?.hideLoadingView()

            switch result {
            case .success(let response):
                if let vehicles = response.poiList {
                    self.vehicles = vehicles
                    self.delegate?.reloadData()
                }
                self.delegate?.endRefreshing()
            case .failure(let error):
                print(error)
                self.delegate?.endRefreshing()
            }
        }
    }

}

extension VehicleListViewModel: VehicleListViewModelProtocol {
    var widthDimension: Double {
        Constants.UI.widthDimension
    }
    
    var heightDimension: Double {
        Constants.UI.heightDimension
    }
    
    var layoutGroupCount: Int {
        Constants.UI.layoutGroupCount
    }
    
    var cellPadding: Double {
        Constants.UI.cellPadding
    }
    
    var numberOfItems: Int {
        vehicles.count
    }
    
    func load() {
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
