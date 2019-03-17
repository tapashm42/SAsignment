//
//  ConcurrentNetworkTests.swift
//  AssignmentTests
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class ConcurrentNetworkTests: XCTestCase {
    
    let aNetworkHelpher = ANetworkHelpher.shared
    let queue = ANetworkHelpher.shared.privateDownloadQueueTestInstance()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMaximumConcurrentOperations() {
        queue.cancelAllOperations()
        for count in 1...10 {
            let requestModel = NetworkRequestModel(url: APIConstant.kBASE_URL,
                                                   taskIdentifier: String(count),
                                                   httpMethod: .GET,
                                                   body: nil,
                                                   headers: nil)
            let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
                XCTAssertTrue(isSuccess, "Failed")
            }
            queue.addOperations([networkOperation], waitUntilFinished: false)
        }
        
        XCTAssertTrue(queue.maxConcurrentOperationCount == 5, "Operation queue is this application is limited to hold only 5 network operation at a time.")
    }
    
    func testSuccessConcurrentOperations() {
        queue.cancelAllOperations()
        let promise = expectation(description: "All added operations must succeed")
        var startedTasksID = ["Task 1", "Task 2", "Task 3", "Task 4", "task 5"]
        
        var competedTaskID: [String] = [] {
            didSet {
                if competedTaskID.count == startedTasksID.count && competedTaskID.sorted() == startedTasksID.sorted() {
                    promise.fulfill()
                }
            }
        }
        
        for task in startedTasksID {
            let requestModel = NetworkRequestModel(url: APIConstant.kBASE_URL,
                                                   taskIdentifier: task,
                                                   httpMethod: .GET,
                                                   body: nil,
                                                   headers: nil)
            let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
                
                if isSuccess {
                    competedTaskID.append(model.taskIdentifier)
                    XCTAssertTrue(isSuccess, "Failed")
                } else {
                    XCTAssertFalse(isSuccess, "Successfully failed")

                }
            }
            queue.addOperations([networkOperation], waitUntilFinished: false)
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
}
