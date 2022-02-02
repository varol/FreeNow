//
//  VehicleListViewModelTests.swift
//  FreeNowTests
//
//  Created by Varol Aksoy on 31.01.2022.
//

import XCTest
@testable import FreeNow
@testable import FreeNowCoreAPI

extension VehicleListViewModelTests {
    fileprivate enum Constants {
        enum Coordinates {
            static let hamburgCoordinates: VehiclesRequestModel = VehiclesRequestModel(p1Lat: "53.694865",
                                                                                       p1Lon: "9.757589",
                                                                                       p2Lat: "53.394655",
                                                                                       p2Lon: "10.099891")
        }
        
        enum UI {
            static let heightDimension: Double = 177
        }
    }
}

class VehicleListViewModelTests: XCTestCase {

    var mockApiService: MockApiService!
    var mockVehicleListViewModelDelegate: MockVehicleListViewModelDelegate!
    var sut: VehicleListViewModel!
    
    override func setUp() {
        mockApiService = MockApiService()
        mockVehicleListViewModelDelegate = MockVehicleListViewModelDelegate()
        sut = VehicleListViewModel()
        sut.delegate = mockVehicleListViewModelDelegate
        sut.apiService = mockApiService
    }

    func test_HeightDimension() {
        XCTAssertEqual(sut.heightDimension, Constants.UI.heightDimension)
    }

    func test_NumberOfItems() {
        XCTAssertEqual(sut.numberOfItems, 0)
    }

    func test_HandleResultWıthSuccessResponse() {
        XCTAssertEqual(sut.numberOfItems, 0)
        sut.handleVehicleResult(vehicles: VehiclesResponse.response.poiList, error: NSError.init())
        XCTAssertEqual(sut.numberOfItems, 121)
    }
    
    func test_ShowLoading() {
        XCTAssertFalse(mockVehicleListViewModelDelegate.invokedShowLoadingView)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedShowLoadingViewCount, 0)
        sut.load()
        XCTAssertTrue(mockVehicleListViewModelDelegate.invokedShowLoadingView)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedShowLoadingViewCount, 1)
    }
    
    func test_HideLoading() {
        XCTAssertFalse(mockVehicleListViewModelDelegate.invokedHideLoadingView)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedHideLoadingViewCount, 0)
        sut.handleVehicleResult(vehicles: VehiclesResponse.response.poiList, error: NSError.init())
        XCTAssertTrue(mockVehicleListViewModelDelegate.invokedHideLoadingView)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedHideLoadingViewCount, 1)
    }
    
    func test_PrepareCollectionView() {
        XCTAssertFalse(mockVehicleListViewModelDelegate.invokedPrepareCollectionView)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedPrepareCollectionViewCount, 0)
        sut.load()
        XCTAssertTrue(mockVehicleListViewModelDelegate.invokedPrepareCollectionView)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedPrepareCollectionViewCount, 1)
    }

    func test_AddRefreshControl() {
        XCTAssertFalse(mockVehicleListViewModelDelegate.invokedAddRefreshControl)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedAddRefreshControlCount, 0)
        sut.load()
        XCTAssertTrue(mockVehicleListViewModelDelegate.invokedAddRefreshControl)
        XCTAssertEqual(mockVehicleListViewModelDelegate.invokedAddRefreshControlCount, 1)
    }

    func test_FetchVehicles() {
        XCTAssertFalse(mockApiService.invokedFetchVehicles)
        XCTAssertEqual(mockApiService.invokedFetchVehiclesCount, 0)
        sut.load()
        XCTAssertTrue(mockApiService.invokedFetchVehicles)
        XCTAssertEqual(mockApiService.invokedFetchVehiclesCount, 1)
    }
}

extension VehiclesResponse {
    static var response: VehiclesResponse {
        let bundle = Bundle(for: FreeNowTests.self)
        let path = bundle.path(forResource: "VehiclesResponse", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let homeResponse = try! JSONDecoder().decode(VehiclesResponse.self, from: data)
        return homeResponse
    }
}
