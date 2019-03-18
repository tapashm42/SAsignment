//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class RepoContributorViewModelTests: XCTestCase {
    
    private var repoContributorVM = RepoContributorViewModel()
    
    override func setUp() {
        if let path = Bundle.main.path(forResource: "RepoContributorModel", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let repoContributorModel = try? JSONDecoder().decode(RepoContributorModel.self, from: data)
                repoContributorVM.addContributorsToRepoViewModel(repoContributorModel?.contributors ?? [])
            }
            catch {
                print("error.localizedDescription\(error.localizedDescription)")
            }
        }    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckEmplyArray() {
        
        XCTAssertEqual(repoContributorVM.numberOfRowsInSection(), 1, "number of rows doesn't matche with array count")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
