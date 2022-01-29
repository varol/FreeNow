//
//  UIWindow+Extension.swift
//  FreeNow
//
//  Created by Varol Aksoy on 29.01.2022.
//

import UIKit

extension UIWindow {
    static var keyWindow: UIWindow? {
        var keyWindow: UIWindow?
        if #available(iOS 13, *) {
            keyWindow = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })
        } else {
            keyWindow = UIApplication.shared.keyWindow
        }
        return keyWindow
    }
}
