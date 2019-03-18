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
                let dateFormatterWithTime: DateFormatter = {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    return formatter
                }()
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                    let container = try decoder.singleValueContainer()
                    let dateStr = try container.decode(String.self)
                    var date: Date? = nil
                    date = dateFormatterWithTime.date(from: dateStr)
                    guard let date_ = date else {
                        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
                    }
                    return date_
                })
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let repoIssueModel = try? decoder.decode(RepoIssueModel.self, from: data)
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
    
}
