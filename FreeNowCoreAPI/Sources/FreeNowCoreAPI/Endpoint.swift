//
//  Endpoint.swift
//  
//
//  Created by Varol Aksoy on 28.01.2022.
//

public protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get}
}

public extension Endpoint {
    var headers: [String: String] { [:] }
    var parameters: [String: Any] { [:] }
    var url: String { "\(baseUrl)\(path)"}
}
