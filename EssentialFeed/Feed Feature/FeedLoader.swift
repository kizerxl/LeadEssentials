//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/8/21.
//

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
