//
//  NSError+Extension.swift
//  FreeNow
//
//  Created by Varol Aksoy on 3.02.2022.
//

import FreeNowCoreAPI

extension NSError {
    class func from(_ apiError: APIClientError) -> NSError {
        return NSError.init(domain: "FreeNow", code: 0, userInfo: [NSLocalizedDescriptionKey : apiError.localizedDescription])
    }
}
