//
//  LoadingShowable.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import UIKit

protocol LoadingShowable {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }

    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}
