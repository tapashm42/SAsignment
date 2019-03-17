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
    
    mutating  func addIssuesToViewModel(_ issues: [Issue]){
        self.issueRepoResponses.append(contentsOf: issues)
    }
    
    func numberOfRowsInSection() -> Int {
        return self.issueRepoResponses.count
    }
    
    func objectAt(_ index: Int) -> Issue{
        return self.issueRepoResponses[index]
    }
    
    mutating  func removeAllPreviousData(){
        self.issueRepoResponses.removeAll()
    }
    
}
