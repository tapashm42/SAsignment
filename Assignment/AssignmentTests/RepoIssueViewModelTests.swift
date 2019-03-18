//
//  RepoIssueViewModelTests.swift
//  AssignmentTests
//
//  Created by TapashM on 18/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class RepoIssueViewModelTests: XCTestCase {

    private var repoIssueVM = RepoIssueViewModel()
    
    override func setUp() {
        if let path = Bundle.main.path(forResource: "RepoIssueModel", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let repoIssueModel = try? JSONDecoder().decode(RepoIssueModel.self, from: data)
                repoIssueVM.addIssuesToViewModel(repoIssueModel?.issues ?? [])
            }
            catch {
                print("error.localizedDescription\(error.localizedDescription)")
            }
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckArrayIsNotEmpty() {
        
        XCTAssertEqual(repoIssueVM.numberOfRowsInSection(), 1, "number of rows doesn't match with array count")
    }
    
    func testCheckHasObject() {
        XCTAssertNotNil(repoIssueVM.objectAt(0),"No object found.")
    }
    
    func testCheckHasAllObjectDeleted() {
        repoIssueVM.removeAllPreviousData()
        XCTAssertEqual(repoIssueVM.numberOfRowsInSection(),0,"Object is still there.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
