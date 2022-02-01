//
//  ApiService.swift
//  FreeNow
//
//  Created by Varol Aksoy on 1.02.2022.
//

import FreeNowCoreAPI
import MapKit.MKGeometry

typealias VehicleResult = Result<VehiclesResponse, APIClientError>

protocol APIServiceProtocol: AnyObject {
    func fetchVehicles(coordinates: VehiclesRequestModel,
                       completion: @escaping ((VehicleResult) -> Void))
    func fetchNearbyVehicles(coordinates: VehiclesRequestModel,
                       completion: @escaping ((VehicleResult) -> Void))
}

class APIService: APIServiceProtocol {
    let networkManager = NetworkManager<VehiclesEndpointItem>()
    
    func fetchVehicles(coordinates: VehiclesRequestModel,
                       completion: @escaping ((VehicleResult) -> Void)) {
        
        networkManager.request(endpoint: .spesificLocation(coordinates),
                               type: VehiclesResponse.self) { result in
            completion(result)
        }
    }
    
    func fetchNearbyVehicles(coordinates: VehiclesRequestModel,
                       completion: @escaping ((VehicleResult) -> Void)) {
        
        networkManager.request(endpoint: .nearby(coordinates),
                               type: VehiclesResponse.self) { result in
            completion(result)
        }
    }
}
