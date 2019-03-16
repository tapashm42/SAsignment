//
//  APIConstant.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct APIConstant {
    
    static let kBASE_URL = "https://api.github.com"
    static let kSEARCH_REPOSITORIES = (urlString: "/search/repositories?q=language:", identifier: "1")
    static let kSEARCH_COMMITS     = (urlString: "/search/commits?q=", identifier: "2")
    static let kSORTING_ORDER = "&sort=stars&order=desc"
    static let kSEARCH_ISSUES     = (urlString: "/search/issues?q=", identifier: "2")
    //static let kSEARCH_CONTRIBUTORS     = (urlString: "/search/issues?q=", identifier: "2")

//    https://api.github.com/search/issues?q=vsouza/awesome-ios+label:bug+language:swift+state:open&sort=created&order=asc

    
}

struct APIHeadersKeyAndValue {
    
    static let kAuthKey = "Accept"
    static let kAuthKeyValue = "application/vnd.github.cloak-preview"
    static let kContentType = "Content-Type"
    static let kContentValue = "application/json"
    
}
