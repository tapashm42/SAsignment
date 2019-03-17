//
//  RepositoryViewModel.swift
//  Assignment
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

/**
 Different options for cell type.
 
 ````
 case descriptionCell
 case issuecell
 case contributorCell
 ````
 */
enum CellType: Int,CaseIterable{
    /// It's for showing name id and decription.
    case descriptionCell
    
    /// It's for showing issues.
    case issuecell
    
    /// It's for showing contributors.
    case contributorCell
}

extension CellType{
    
    /// It's for different cell identifier.
    var cellIdentifier: String {
        get {
            switch self {
            case .descriptionCell:
                return "ARepoDescriptionCell"
            case .issuecell :
                fallthrough
            case .contributorCell:
                return "ACell"
            }
        }
    }
}

extension CellType{
    
    /// It's for different tableview header title.
    var HeaderTitle: String {
        get {
            switch self {
            case .descriptionCell:
                return "Description"
            case .issuecell:
                return "3 newest issues"
            case .contributorCell:
                return "3 top contributors"
            }
        }
    }
}

struct RepositoryDescriptionViewModel {
    
    /// This is a **model** of  *description, full name, language, repository* .
     var repoDetailModel: RepoDetailModel!
    
    /**
     This is a constructive method that generates the RepoDetailModel from description,id and full name.
     
     - Parameter description: It's the description of a specific Repository.
     - Parameter fName: It's the full name of a specific Repository.
     - Parameter repoId: It's the Repository id.
     - Parameter language: It's the queried language.
     */
    mutating func constructRepoModel(description: String,fName: String, repoId:Int, language: String) -> RepoDetailModel? {
        let model = RepoDetailModel(description: description, fullName: fName, repoID: repoId,language: language)
        return model
    }
}
