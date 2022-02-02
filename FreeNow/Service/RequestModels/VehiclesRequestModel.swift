//
//  VehiclesRequestModel.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import Foundation

@objcMembers
class VehiclesRequestModel: NSObject {
    let p1Lat: String
    let p1Lon: String
    let p2Lat: String
    let p2Lon: String

  @objc internal init(p1Lat: String, p1Lon: String, p2Lat: String, p2Lon: String) {
        self.p1Lat = p1Lat
        self.p1Lon = p1Lon
        self.p2Lat = p2Lat
        self.p2Lon = p2Lon
    }
}
