//
//  ApiService.swift
//  FreeNow
//
//  Created by Varol Aksoy on 1.02.2022.
//

import FreeNowCoreAPI
import MapKit.MKGeometry

@objc protocol APIServiceProtocol  {
    func fetchVehicles(coordinates: VehiclesRequestModel,
                       completion: @escaping (([Vehicle]?, NSError?) -> Void))
    func fetchNearbyVehicles(coordinates: VehiclesRequestModel,
                       completion: @escaping (([Vehicle]?, NSError?) -> Void))
}

@objcMembers
class APIService: NSObject, APIServiceProtocol {
    
    let networkManager = NetworkManager<VehiclesEndpointItem>()

    func fetchNearbyVehicles(coordinates: VehiclesRequestModel, completion: @escaping (([Vehicle]?, NSError?) -> Void)) {
        networkManager.request(endpoint: .nearby(coordinates),
                               type: VehiclesResponse.self) { result in
            switch result {
            case .success(let response):
                completion(response.poiList, nil)
            case .failure(let error):
                completion([], NSError.from(error))
            }
        }
    }
    
    func fetchVehicles(coordinates: VehiclesRequestModel, completion: @escaping (([Vehicle]?, NSError?) -> Void)) {
        networkManager.request(endpoint: .spesificLocation(coordinates),
                               type: VehiclesResponse.self) { result in
            switch result {
            case .success(let response):
                completion(response.poiList, nil)
            case .failure(let error):
                completion([], NSError.from(error))
            }
        }
    }
}

extension NSError {
  class func from(_ apiError: APIClientError) -> NSError {
    return NSError.init(domain: "FreeNow", code: 0, userInfo: [NSLocalizedDescriptionKey : apiError.localizedDescription])
  }
}
