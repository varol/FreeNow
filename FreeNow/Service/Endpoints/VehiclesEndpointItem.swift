//
//  VehiclesEndpointItem.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation
import FreeNowCoreAPI

enum VehiclesEndpointItem: Endpoint {
    case spesificLocation(_ coordinates: VehiclesRequestModel)
    case nearby(_ coordinates: VehiclesRequestModel)

    var baseUrl: String { "https://poi-api.mytaxi.com/" }
    
    var path: String {
        switch self {
        case .spesificLocation, .nearby:
            return "PoiService/poi/v1"
        }
    }

    var parameters: [String : Any] {
        switch self {
        case .spesificLocation(let coordinates), .nearby(let coordinates):
            return ["p1Lat": coordinates.p1Lat,
                    "p1Lon": coordinates.p1Lon,
                    "p2Lat": coordinates.p2Lat,
                    "p2Lon": coordinates.p2Lon]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .spesificLocation:
            return .get
        case .nearby:
            return .get
        }
    }
}
