//
//  VehiclesResponse.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation
import CoreLocation

// MARK: - Vehicles
struct VehiclesResponse: Codable {
    let poiList: [Vehicle]?
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let id: Int?
    let coordinate: Coordinate?
    let state: State?
    let type: TypeEnum?
    let heading: Double?
    
    public var coordinates: CLLocationCoordinate2D {
      return CLLocationCoordinate2DMake(coordinate?.latitude ?? 0, coordinate?.longitude ?? 0)
    }
}

// MARK: - Coordinate
struct Coordinate: Codable {
    let latitude, longitude: Double?
}

enum State: String, Codable {
    case active = "ACTIVE"
}

enum TypeEnum: String, Codable {
    case taxi = "TAXI"
}
