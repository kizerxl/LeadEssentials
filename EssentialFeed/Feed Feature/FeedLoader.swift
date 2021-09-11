//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/8/21.
//

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
