//
//  RepositoryDescriptionViewModelTests.swift
//  AssignmentTests
//
//  Created by TapashM on 18/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class RepositoryDescriptionViewModelTests: XCTestCase {
    
    private var repositoryDescriptionVM = RepositoryDescriptionViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testModelNotInitialize() {
        
        XCTAssertNil(repositoryDescriptionVM.repoDetailModel,"Not Initialized.")
    }
    
    func testModelInitialize() {
        let repoDetailModel = RepoDetailModel(description: "a repository", fullName: "test", repoID: 12222, language: "swift")
        XCTAssertNotNil(repoDetailModel,"Not Initialized.")
    }
}
