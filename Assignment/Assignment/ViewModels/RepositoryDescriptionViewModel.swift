//
//  RepositoryViewModel.swift
//  Assignment
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

enum CellType: Int,CaseIterable{
    case descriptionCell
    case issuecell
    case contributorCell
}

extension CellType{
    var cellIdentifier: String {
        get {
            switch self {
            case .descriptionCell:
                return "ARepoDescriptionCell"
            case .issuecell:
                return "ARepoIssueCell"
            case .contributorCell:
                return "ARepoContributorCell"
            }
        }
    }
}

extension CellType{
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
     var repoDetailModel: RepoDetailModel!
    
   mutating func constructRepoModel(description: String,fName: String, repoId:Int) -> RepoDetailModel? {
        let model = RepoDetailModel(description: description, fullName: fName, repoID: repoId)
        return model
    }
}
