//
//  MockMapViewModelDelegate.swift
//  FreeNowTests
//
//  Created by Varol Aksoy on 1.02.2022.
//

@testable import FreeNow
import MapKit.MKAnnotation

final class MockMapViewModelDelegate: MapViewModelDelegate {

    var invokedShowLoadingView = false
    var invokedShowLoadingViewCount = 0

    func showLoadingView() {
        invokedShowLoadingView = true
        invokedShowLoadingViewCount += 1
    }

    var invokedHideLoadingView = false
    var invokedHideLoadingViewCount = 0

    func hideLoadingView() {
        invokedHideLoadingView = true
        invokedHideLoadingViewCount += 1
    }

    var invokedPrepareMapView = false
    var invokedPrepareMapViewCount = 0

    func prepareMapView() {
        invokedPrepareMapView = true
        invokedPrepareMapViewCount += 1
    }

    var invokedAddAnnotations = false
    var invokedAddAnnotationsCount = 0
    var invokedAddAnnotationsParameters: (annotation: MKPointAnnotation, Void)?
    var invokedAddAnnotationsParametersList = [(annotation: MKPointAnnotation, Void)]()

    func addAnnotations(_ annotation: MKPointAnnotation) {
        invokedAddAnnotations = true
        invokedAddAnnotationsCount += 1
        invokedAddAnnotationsParameters = (annotation, ())
        invokedAddAnnotationsParametersList.append((annotation, ()))
    }
}
