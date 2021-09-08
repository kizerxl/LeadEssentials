//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/8/21.
//

class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

