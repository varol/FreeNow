//
//  BaseCollectionViewCell.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: UIScreen.main.bounds.size.width / ((UIDevice.current.userInterfaceIdiom == .phone) ? 1 : 2), height: 0);
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel);
        
        return layoutAttributes;
    }

}
