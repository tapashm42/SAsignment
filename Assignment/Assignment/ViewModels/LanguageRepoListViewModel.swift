//
//  LanguageRepoListViewModel.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct LanguageRepoListViewModel {
    
    private var languageRepoResponses = [Item]()

    mutating  func addLanguageRepoViewModel(_ items: [Item]){
        self.languageRepoResponses.append(contentsOf: items)
    }
    
    func numberOfRowsInSection() -> Int {
        return self.languageRepoResponses.count
    }
    
    func objectAt(_ index: Int) -> Item{
        return self.languageRepoResponses[index]
    }
    
    mutating  func removeAllPreviousData(){
        self.languageRepoResponses.removeAll()
    }
    
}
