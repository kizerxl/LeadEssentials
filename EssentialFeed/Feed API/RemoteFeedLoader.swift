//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/8/21.
//

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}

protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

