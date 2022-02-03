//
//  LoadingView.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import UIKit

@objcMembers
class LoadingView: NSObject {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    @objc static let shared = LoadingView()
    var blurView: UIVisualEffectView = UIVisualEffectView()

    private override init() {
        super.init()
        configure()
    }

    func configure() {
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.frame = UIWindow(frame: UIScreen.main.bounds).frame
        activityIndicator.center = blurView.center
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = .medium
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.hidesWhenStopped = true
        blurView.contentView.addSubview(activityIndicator)
    }

    func startLoading() {
        UIApplication.shared.windows.first?.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        blurView.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
}
