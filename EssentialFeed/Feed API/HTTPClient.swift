//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/10/21.
//

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure (Error)
}

