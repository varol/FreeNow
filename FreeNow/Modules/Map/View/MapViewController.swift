//
//  MapViewController.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit
import MapKit

final class MapViewController: BaseViewController {
    @IBOutlet private weak var mapView: MKMapView!
    
    var viewModel: MapViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        viewModel.fetchVehicles(with: mapView.visibleMapRect)
    }
}

extension MapViewController: MapViewModelDelegate {
    func addAnnotations(_ annotation: MKPointAnnotation) {
        DispatchQueue.main.async {
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func prepareMapView() {
        mapView.delegate = self
        let region = MKCoordinateRegion(center: viewModel.initialCoordinate(),
                                        span: viewModel.coordinateSpan())
        mapView.setRegion(region, animated: true)
    }
}
