//
//  VehiclesResponse.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation

// MARK: - Vehicles
struct VehiclesResponse: Codable {
    let poiList: [PoiList]?
}

// MARK: - PoiList
struct PoiList: Codable {
    let id: Int?
    let coordinate: Coordinate?
    let state: State?
    let type: TypeEnum?
    let heading: Double?
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
