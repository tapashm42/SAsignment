//
//  RepoDetailModel.swift
//  Assignment
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct RepoDetailModel {
    
    public private(set) var description: String
    public private(set) var fullName: String
    public private(set) var repoID: Int = 0
    public private(set) var language: String
    
    init(description: String, fullName:String, repoID:Int,language: String) {
        self.description = description
        self.fullName = fullName
        self.repoID = repoID
        self.language = language
    }
}
