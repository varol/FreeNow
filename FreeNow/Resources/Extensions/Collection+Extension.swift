//
//  Collection+Extension.swift
//  FreeNow
//
//  Created by Varol Aksoy on 28.01.2022.
//

import Foundation

public extension Collection where Indices.Iterator.Element == Index {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
