//
//  MockNetworkManager.swift
//  FreeNowTests
//
//  Created by Varol Aksoy on 31.01.2022.
//

@testable import FreeNow
@testable import FreeNowCoreAPI

final class MockApiService: APIServiceProtocol {

    var invokedFetchVehicles = false
    var invokedFetchVehiclesCount = 0
    var invokedFetchVehiclesParameters: (coordinates: VehiclesRequestModel, Void)?
    var invokedFetchVehiclesParametersList = [(coordinates: VehiclesRequestModel, Void)]()
    var stubbedFetchVehiclesCompletionResult: (VehicleResult, Void)?

    func fetchVehicles(coordinates: VehiclesRequestModel,
        completion: @escaping ((VehicleResult) -> Void)) {
        invokedFetchVehicles = true
        invokedFetchVehiclesCount += 1
        invokedFetchVehiclesParameters = (coordinates, ())
        invokedFetchVehiclesParametersList.append((coordinates, ()))
        if let result = stubbedFetchVehiclesCompletionResult {
            completion(result.0)
        }
    }

    var invokedFetchNearbyVehicles = false
    var invokedFetchNearbyVehiclesCount = 0
    var invokedFetchNearbyVehiclesParameters: (coordinates: VehiclesRequestModel, Void)?
    var invokedFetchNearbyVehiclesParametersList = [(coordinates: VehiclesRequestModel, Void)]()
    var stubbedFetchNearbyVehiclesCompletionResult: (VehicleResult, Void)?

    func fetchNearbyVehicles(coordinates: VehiclesRequestModel,
        completion: @escaping ((VehicleResult) -> Void)) {
        invokedFetchNearbyVehicles = true
        invokedFetchNearbyVehiclesCount += 1
        invokedFetchNearbyVehiclesParameters = (coordinates, ())
        invokedFetchNearbyVehiclesParametersList.append((coordinates, ()))
        if let result = stubbedFetchNearbyVehiclesCompletionResult {
            completion(result.0)
        }
    }
}
