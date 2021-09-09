//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Felix Changoo on 9/8/21.
//

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
