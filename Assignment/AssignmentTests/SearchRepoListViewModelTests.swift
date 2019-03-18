//
//  SearchRepoListViewModelTests.swift
//  AssignmentTests
//
//  Created by TapashM on 18/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest
@testable import Assignment

class SearchRepoListViewModelTests: XCTestCase {

    private var languageRepoListVM = SearchRepositoryViewModel()
    
    override func setUp() {
        if let path = Bundle.main.path(forResource: "SearchRepository", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let languageRepositoryModel = try? JSONDecoder().decode(SearchRepositoryResponse.self, from: data)
               languageRepoListVM.addLanguageRepoViewModel(languageRepositoryModel?.items ?? [])
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
        
        XCTAssertEqual(languageRepoListVM.numberOfRowsInSection(), 1, "number of rows doesn't match with array count")
    }
    
    func testCheckHasObject() {
        XCTAssertNotNil(languageRepoListVM.objectAt(0),"No object found.")
    }
    
    func testCheckHasAllObjectDeleted() {
        languageRepoListVM.removeAllPreviousData()
        XCTAssertEqual(languageRepoListVM.numberOfRowsInSection(),0,"Object is still there.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

