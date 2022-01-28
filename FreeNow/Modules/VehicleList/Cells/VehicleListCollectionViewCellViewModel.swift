//
//  VehicleListCollectionViewCellViewModel.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import Foundation

protocol VehicleListCollectionViewCellViewModelProtocol {
    var delegate: VehicleListCollectionViewCellViewModelDelegate? { get set }

    func load()
}

protocol VehicleListCollectionViewCellViewModelDelegate: AnyObject {
    func prepareShadow()
    func setIdLabel(_ text: String)
    func setLongitudeLabel(_ text: String)
    func setLatitudeLabel(_ text: String)
    func setStateLabel(_ text: String)
    func setTypeLabel(_ text: String)
    func setHeadingLabel(_ text: String)
}

final class VehicleListCollectionViewCellViewModel: BaseViewModel {
    private let vehicle: PoiList
    weak var delegate: VehicleListCollectionViewCellViewModelDelegate?

    init(vehicle: PoiList) {
        self.vehicle = vehicle
    }

}

extension VehicleListCollectionViewCellViewModel: VehicleListCollectionViewCellViewModelProtocol {
    func load() {
        delegate?.prepareShadow()
        delegate?.setIdLabel("\(vehicle.id ?? 0)")
        delegate?.setLongitudeLabel("\(vehicle.coordinate?.longitude ?? 0)")
        delegate?.setLatitudeLabel("\(vehicle.coordinate?.latitude ?? 0)")
        delegate?.setStateLabel(vehicle.state?.rawValue ?? "")
        delegate?.setTypeLabel(vehicle.type?.rawValue ?? "")
        delegate?.setHeadingLabel("\(vehicle.heading ?? 0)")
    }
}
