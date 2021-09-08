//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/8/21.
//

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
