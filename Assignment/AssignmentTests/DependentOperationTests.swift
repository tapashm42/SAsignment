//
//  DependentOperationTests.swift
//  AssignmentTests
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class DependentOperationTests: XCTestCase {
    
    let aNetworkHelpher = ANetworkHelpher.shared
    let queue = ANetworkHelpher.shared.privateDownloadQueueTestInstance()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDependentOperationSequence() {
        queue.cancelAllOperations()
        let promise = expectation(description: "Original Task Sequence and Expected Task Sequence are same")
        let expectedTaskSequence: [String] = ["Task 1", "Task 2", "Task 3", "Task 4"]
        var actualTaskSequence: [String] = [] {
            didSet {
                if actualTaskSequence == expectedTaskSequence {
                    promise.fulfill()
                }
            }
        }
        
        let requestModel1 = NetworkRequestModel(url: "http://google.com",
                                                taskIdentifier: "Task 1",
                                                httpMethod: .GET,
                                                body: nil,
                                                headers: nil)
        
        let networkOperation1 = NetworkOperation(model: requestModel1) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                actualTaskSequence.append(model.taskIdentifier)
            } else {
                
            }
        }
        
        
        let requestModel2 = NetworkRequestModel(url: "http://google.com",
                                                taskIdentifier: "Task 2",
                                                httpMethod: .GET,
                                                body: nil,
                                                headers: nil)
        
        let networkOperation2 = NetworkOperation(model: requestModel2) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                actualTaskSequence.append(model.taskIdentifier)
            } else {
                
            }
        }
        
        let requestModel3 = NetworkRequestModel(url: "http://google.com",
                                                taskIdentifier: "Task 3",
                                                httpMethod: .GET,
                                                body: nil,
                                                headers: nil)
        
        let networkOperation3 = NetworkOperation(model: requestModel3) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                actualTaskSequence.append(model.taskIdentifier)
            } else {
                
            }
        }
        
        
        let requestModel4 = NetworkRequestModel(url: "http://google.com",
                                                taskIdentifier: "Task 4",
                                                httpMethod: .GET,
                                                body: nil,
                                                headers: nil)
        
        let networkOperation4 = NetworkOperation(model: requestModel4) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                actualTaskSequence.append(model.taskIdentifier)
            } else {
                
            }
        }
        
        networkOperation2.addDependency(networkOperation1)
        networkOperation3.addDependency(networkOperation2)
        networkOperation4.addDependency(networkOperation3)
        queue.addOperations([networkOperation1, networkOperation2, networkOperation3, networkOperation4], waitUntilFinished: true)
        waitForExpectations(timeout: 15, handler: nil)
    }
}
