//
//  RepoIssueViewModel.swift
//  Assignment
//
//  Created by TapashM on 17/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct RepoIssueViewModel {
    
    private var issueRepoResponses = [Issue]() 
    
    /**
     This is a method add items to the  array.
     - Parameter issues: It's the array of a Issue.
     */
    mutating  func addIssuesToViewModel(_ issues: [Issue]){
        self.issueRepoResponses.append(contentsOf: issues)
    }
    
    /**
     This is a method that gives the number of rows in section.
     - Returns: It's the issueRepoResponses array count.
     */
    func numberOfRowsInSection() -> Int {
        return self.issueRepoResponses.count
    }
    
    /**
     This is a method that gives issue for a  idex.
     - Parameter index:  The item of this index path, when used with `UITableView`.
     - Returns: An item containing all the necessary attributes.
     */
    func objectAt(_ index: Int) -> Issue{
        return self.issueRepoResponses[index]
    }
    
    /**
     /// Removes all elements from the array.
     */
    mutating  func removeAllPreviousData(){
        self.issueRepoResponses.removeAll()
    }
    
}
