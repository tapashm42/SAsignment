//
//  CancelNetworkOperationTests.swift
//  AssignmentTests
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class CancelNetworkOperationTests: XCTestCase {
    
    let aNetworkHelpher = ANetworkHelpher.shared
    let queue = ANetworkHelpher.shared.privateDownloadQueueTestInstance()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAllCancelOperations() {
        queue.cancelAllOperations()
        let promise = expectation(description: "All added operations must succeed")
        
        for count in 1...10 {
            let requestModel = NetworkRequestModel(url: "http://google.com",
                                                   taskIdentifier: String(count),
                                                   httpMethod: .GET,
                                                   body: nil,
                                                   headers: nil)
            let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
                XCTAssertTrue(isSuccess, "Failed")
            }
            queue.addOperations([networkOperation], waitUntilFinished: false)
            
        }
        
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            ANetworkHelpher.shared.cancelAll()
            
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                if self.queue.operations.count == 0 {
                    promise.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 15, handler: nil)
    }
    
}
