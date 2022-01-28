//
//  VehiclesEndpointItem.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation
import FreeNowCoreAPI

enum VehiclesEndpointItem: Endpoint {
    case spesificLocation(p1Lat: String,
                          p1Lon: String,
                          p2Lat: String,
                          p2Lon: String)

    var baseUrl: String { "https://poi-api.mytaxi.com/PoiService/poi/v1" }
    
    var path: String {
        switch self {
        case .spesificLocation(let p1Lat,
                               let p1Lon,
                               let p2Lat,
                               let p2Lon): return "?p1Lat=\(p1Lat)&p1Lon=\(p1Lon)&p2Lat=\(p2Lat)&p2Lon=\(p2Lon)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .spesificLocation: return .get
        }
    }
}
