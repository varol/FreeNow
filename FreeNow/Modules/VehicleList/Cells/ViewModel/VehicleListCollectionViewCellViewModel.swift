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
    func setIdLabelText(_ text: String)
    func setLongitudeLabelText(_ text: String)
    func setLatitudeLabelText(_ text: String)
    func setStateLabelText(_ text: String)
    func setTypeLabelText(_ text: String)
    func setHeadingLabelText(_ text: String)
}

@objcMembers
final class VehicleListCollectionViewCellViewModel: BaseViewModel {
    private let vehicle: Vehicle
    weak var delegate: VehicleListCollectionViewCellViewModelDelegate?

    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }

}

extension VehicleListCollectionViewCellViewModel: VehicleListCollectionViewCellViewModelProtocol {
    func load() {
        delegate?.setIdLabelText("\(vehicle.id ?? 0)")
        delegate?.setLongitudeLabelText("\(vehicle.coordinate?.longitude ?? 0)")
        delegate?.setLatitudeLabelText("\(vehicle.coordinate?.latitude ?? 0)")
        delegate?.setStateLabelText(vehicle.state ?? "")
        delegate?.setTypeLabelText(vehicle.type ?? "")
        delegate?.setHeadingLabelText("\(vehicle.heading ?? 0)")
    }
}
