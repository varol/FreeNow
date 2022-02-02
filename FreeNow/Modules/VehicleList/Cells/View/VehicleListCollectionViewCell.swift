//
//  VehicleListCollectionViewCell.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit

@objcMembers
final class VehicleListCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet private weak var idLabel: BaseLabel!
    @IBOutlet private weak var latitudeLabel: BaseLabel!
    @IBOutlet private weak var longitudeLabel: BaseLabel!
    @IBOutlet private weak var stateLabel: BaseLabel!
    @IBOutlet private weak var typeLabel: BaseLabel!
    @IBOutlet private weak var headingLabel: BaseLabel!
    
    var viewModel: VehicleListCollectionViewCellViewModel! {
        didSet {
            viewModel.delegate = self
            viewModel.load()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        idLabel.text = nil
        latitudeLabel.text = nil
        longitudeLabel.text = nil
        stateLabel.text = nil
        typeLabel.text = nil
        headingLabel.text = nil
    }
}

extension VehicleListCollectionViewCell: VehicleListCollectionViewCellViewModelDelegate {
    func setIdLabelText(_ text: String) {
        idLabel.text = text
    }
    
    func setLongitudeLabelText(_ text: String) {
        longitudeLabel.text = String(text)
    }
    
    func setLatitudeLabelText(_ text: String) {
        latitudeLabel.text = text
    }
    
    func setStateLabelText(_ text: String) {
        stateLabel.text = text
    }
    
    func setTypeLabelText(_ text: String) {
        typeLabel.text = text
    }
    
    func setHeadingLabelText(_ text: String) {
        headingLabel.text = text
    }
}
