//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Felix Changoo on 9/12/21.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL) {
        session.dataTask(with: url) { _, _, _  in }.resume()
    }
}

// MARK: Helpers

class URLSessionHTTPClientTests: XCTestCase {
    func test_getFromURL_createsDataTaskWithURL() {
        let url = URL(string: "https://www.a-site.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        
        XCTAssertEqual(session.recievedURLs, [url])
    }
    
    func test_getFromURL_resumesDataTaskWithURL() {
        let url = URL(string: "https://www.a-site.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, task: task)
        
        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url)
        
        XCTAssertEqual(task.resumeCallCount, 1)
    }
    
    private class URLSessionSpy: URLSession {
        var recievedURLs = [URL]()
        private var stubs = [URL: URLSessionDataTask]()
        
        func stub(url: URL, task: URLSessionDataTask) {
            stubs[url] = task
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            recievedURLs.append(url)
            return stubs[url] ?? FakeURLSessionDataTask()
        }
        
    }
    private class FakeURLSessionDataTask: URLSessionDataTask {
        override func resume() {}
    }
    private class URLSessionDataTaskSpy: URLSessionDataTask {
        var resumeCallCount = 0
        
        override func resume() {
            resumeCallCount += 1
        }
    }
}
