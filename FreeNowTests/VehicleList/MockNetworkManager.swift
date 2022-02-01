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
}
