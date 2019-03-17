//
//  RepoContributorViewModel.swift
//  Assignment
//
//  Created by TapashM on 17/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct RepoContributorViewModel {
    
    private var contributorRepoResponses = [Contributor]()
    
    mutating  func addContributorsToRepoViewModel(_ contributors: [Contributor]){
        self.contributorRepoResponses.append(contentsOf: contributors)
    }
    
    func numberOfRowsInSection() -> Int {
        return self.contributorRepoResponses.count
    }
    
    func objectAt(_ index: Int) -> Contributor{
        return self.contributorRepoResponses[index]
    }
    
    mutating  func removeAllPreviousData(){
        self.contributorRepoResponses.removeAll()
    }
    
}
