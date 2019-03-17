//
//  LanguageRepoListViewModel.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct LanguageRepoListViewModel {
    
    /// This is an **array** of *Item* .
    private var languageRepoResponses = [Item]()

    /**
     This is a method add items to the  array.
     - Parameter items: It's the array of a Item.
     */
    mutating  func addLanguageRepoViewModel(_ items: [Item]){
        self.languageRepoResponses.append(contentsOf: items)
    }
    
    /**
     This is a method that gives the number of rows in section.
     - Returns: It's the languageRepoResponses array count.
     */
    func numberOfRowsInSection() -> Int {
        return self.languageRepoResponses.count
    }
    
    /**
     This is a method that gives item for a  idex.
     - Parameter index:  The item of this index path, when used with `UITableView`.
     - Returns: An item containing all the necessary attributes.
     */
    func objectAt(_ index: Int) -> Item{
        return self.languageRepoResponses[index]
    }
    
    /**
     /// Removes all elements from the array.
     */
    mutating  func removeAllPreviousData(){
        self.languageRepoResponses.removeAll()
    }
    
}
