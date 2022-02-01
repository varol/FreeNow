//
//  MapViewModelTests.swift
//  FreeNowTests
//
//  Created by Varol Aksoy on 1.02.2022.
//

import XCTest
@testable import FreeNow

class MapViewModelTests: XCTestCase {

    var mockApiService: MockApiService!
    var mockMapViewModelDelegate: MockMapViewModelDelegate!
    var sut: MapViewModel!
    
    override func setUp() {
        mockApiService = MockApiService()
        mockMapViewModelDelegate = MockMapViewModelDelegate()
        sut = MapViewModel()
        sut.delegate = mockMapViewModelDelegate
        sut.apiService = mockApiService
    }

    func test_ShowLoading() {
        XCTAssertFalse(mockMapViewModelDelegate.invokedShowLoadingView)
        XCTAssertEqual(mockMapViewModelDelegate.invokedShowLoadingViewCount, 0)
        sut.load()
        XCTAssertTrue(mockMapViewModelDelegate.invokedShowLoadingView)
        XCTAssertEqual(mockMapViewModelDelegate.invokedShowLoadingViewCount, 1)
    }
    
    func test_HideLoading() {
        XCTAssertFalse(mockMapViewModelDelegate.invokedHideLoadingView)
        XCTAssertEqual(mockMapViewModelDelegate.invokedHideLoadingViewCount, 0)
        sut.handleVehicleResult(result: .success(.response))
        XCTAssertTrue(mockMapViewModelDelegate.invokedHideLoadingView)
        XCTAssertEqual(mockMapViewModelDelegate.invokedHideLoadingViewCount, 1)
    }
    
    func test_PrepareMapView() {
        XCTAssertFalse(mockMapViewModelDelegate.invokedPrepareMapView)
        XCTAssertEqual(mockMapViewModelDelegate.invokedPrepareMapViewCount, 0)
        sut.load()
        XCTAssertTrue(mockMapViewModelDelegate.invokedPrepareMapView)
        XCTAssertEqual(mockMapViewModelDelegate.invokedPrepareMapViewCount, 1)
    }
    
    func test_AddAnnotation() {
        XCTAssertFalse(mockMapViewModelDelegate.invokedAddAnnotations)
        XCTAssertEqual(mockMapViewModelDelegate.invokedAddAnnotationsCount, 0)
        sut.handleVehicleResult(result: .success(.response))
        XCTAssertTrue(mockMapViewModelDelegate.invokedAddAnnotations)
        XCTAssertEqual(mockMapViewModelDelegate.invokedAddAnnotationsCount, 121)
    }
}
