//
//  VehiclesResponse.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation
import CoreLocation

// MARK: - Vehicles
@objcMembers
class VehiclesResponse: NSObject, Codable {
    let poiList: [Vehicle]?
}

// MARK: - Vehicle
@objcMembers
class Vehicle: NSObject, Codable {
    let id: Int?
    let coordinate: Coordinate?
    let state: String?
    let type: String?
    let heading: Double?
    
    public var coordinates: CLLocationCoordinate2D {
      return CLLocationCoordinate2DMake(coordinate?.latitude ?? 0, coordinate?.longitude ?? 0)
    }
}

// MARK: - Coordinate
@objcMembers
class Coordinate: NSObject,Codable {
    let latitude, longitude: Double?
}

enum State: String, Codable {
    case active = "ACTIVE"
}

enum TypeEnum: String, Codable {
    case taxi = "TAXI"
}
