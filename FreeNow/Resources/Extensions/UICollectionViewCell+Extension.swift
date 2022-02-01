//
//  UICollectionViewCell+Extension.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
