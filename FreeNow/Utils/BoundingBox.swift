//
//  BoundingBox.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import MapKit

struct BoundingBox {
    let min: CLLocationCoordinate2D
    let max: CLLocationCoordinate2D
    
    init(rect: MKMapRect) {
        let bottomLeft = MKMapPoint(x: rect.origin.x, y: rect.maxY)
        let topRight = MKMapPoint(x: rect.maxX, y: rect.origin.y)
        
        min = bottomLeft.coordinate
        max = topRight.coordinate
    }
    
    var points: [CLLocationDegrees] {
        return [
            min.latitude,
            min.longitude,
            max.latitude,
            max.longitude,
        ]
    }
}
