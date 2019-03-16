//
//  SeveralNetworkOperationsTests.swift
//  AssignmentTests
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class SeveralNetworkOperationsTests: XCTestCase {
    
    let aNetworkHelpher = ANetworkHelpher.shared
    let queue = ANetworkHelpher.shared.privateDownloadQueueTestInstance()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMoreThanMaximumConcurrentOperations() {
        queue.cancelAllOperations()
        let promise = expectation(description: "All added operations must succeed")
        var completed: [String] = [] {
            didSet {
                if completed.count == 20 {
                    promise.fulfill()
                }
            }
        }
        
        for count in 1...20 {
            let requestModel = NetworkRequestModel(url: "http://google.com",
                                                   taskIdentifier: String(count),
                                                   httpMethod: .GET,
                                                   body: nil,
                                                   headers: nil)
            let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
                if isSuccess {
                    completed.append(model.taskIdentifier)
                    print("ID --> \(model.taskIdentifier) Count -> \(count) ")
                } else {
                    
                }
            }
            queue.addOperations([networkOperation], waitUntilFinished: false)
        }
        waitForExpectations(timeout: 120, handler: nil)
    }
    
}
