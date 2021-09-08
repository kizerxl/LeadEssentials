//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Felix Changoo on 9/8/21.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    func test_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_requestDataFromURL() {
        let url = URL(string:"https://www.a-new-site.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string:"https://www.google.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private final class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
}
