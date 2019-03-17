//
//  RepoContributorViewModel.swift
//  Assignment
//
//  Created by TapashM on 17/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct RepoContributorViewModel {
    
    /// This is an **array** of *Contributor* .
    private var contributorRepoResponses = [Contributor]()
    
    /**
     This is a method add contributors to the  array.
     - Parameter contributors: It's the array of a Contributor.
     */
    mutating  func addContributorsToRepoViewModel(_ contributors: [Contributor]){
        self.contributorRepoResponses.append(contentsOf: contributors)
    }
    
    /**
     This is a method that gives the number of rows in section.
     - Returns: It's the contributorRepoResponses array count.
     */
    func numberOfRowsInSection() -> Int {
        return self.contributorRepoResponses.count
    }
    
    /**
     This is a method that gives contributor for a  idex.
     - Parameter index:  The contributor of this index path, when used with `UITableView`.
     - Returns: An contributor containing all the necessary attributes.
     */
    func objectAt(_ index: Int) -> Contributor{
        return self.contributorRepoResponses[index]
    }
    
    /**
     /// Removes all elements from the array.
     */
    mutating  func removeAllPreviousData(){
        self.contributorRepoResponses.removeAll()
    }
    
}
