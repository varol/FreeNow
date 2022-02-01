//
//  MapViewModel.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import MapKit

extension MapViewModel {
    fileprivate enum Constants {
        static let hamburgCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 53.694865,
                                                                                              longitude: 9.757589)
        static let coordinateSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.5,
                                                                       longitudeDelta: 0.5)
    }
}

protocol MapViewModelProtocol {
    var delegate: MapViewModelDelegate? { get set }

    func load()
    func fetchVehicles(with mapRegion: MKMapRect)
    func vehicleItems() -> [Vehicle]?
    func initialCoordinate() -> CLLocationCoordinate2D
    func coordinateSpan() -> MKCoordinateSpan
}

protocol MapViewModelDelegate: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func prepareMapView()
    func addAnnotations(_ annotation: MKPointAnnotation)
}

final class MapViewModel: BaseViewModel {
    private var vehicles: [Vehicle] = []
    var apiService: APIServiceProtocol
    weak var delegate: MapViewModelDelegate?

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    internal func fetchVehicles(_ mapRegion: MKMapRect) {
        
        apiService.fetchNearbyVehicles(coordinates: getVehicleRequestModel(mapRegion)) {[weak self] result in
            guard let self = self else { return }
            self.handleVehicleResult(result: result)
        }
    }
    
    internal func handleVehicleResult(result: VehicleResult) {
        self.delegate?.hideLoadingView()
        
        switch result {
        case .success(let response):
            if let vehicles = response.poiList {
                self.vehicles = vehicles
                self.addAnnotation(with: vehicles)
            }
        case .failure(let error):
            print(error)
        }
    }

    internal func getVehicleRequestModel(_ mapRegion: MKMapRect) -> VehiclesRequestModel {
        let boundingBox = BoundingBox(rect: mapRegion)
        let requestModel = VehiclesRequestModel(p1Lat: String(boundingBox.min.latitude),
                                                p1Lon: String(boundingBox.min.longitude),
                                                p2Lat: String(boundingBox.max.latitude),
                                                p2Lon: String(boundingBox.max.longitude))
        return requestModel
    }
    
    internal func addAnnotation(with vehicles: [Vehicle]) {
        vehicles.forEach { vehicle in
            let annotation = MKPointAnnotation()
            annotation.coordinate = vehicle.coordinates
            annotation.title = "\(vehicle.id ?? 0)"
            self.delegate?.addAnnotations(annotation)
        }
    }
}

extension MapViewModel: MapViewModelProtocol {
    func coordinateSpan() -> MKCoordinateSpan {
        Constants.coordinateSpan
    }
    
    func initialCoordinate() -> CLLocationCoordinate2D {
        Constants.hamburgCoordinate
    }
    
    func load() {
        delegate?.prepareMapView()
        delegate?.showLoadingView()
    }
    
    func vehicleItems() -> [Vehicle]? {
        vehicles
    }
    
    func fetchVehicles(with mapRegion: MKMapRect) {
        fetchVehicles(mapRegion)
    }
}
