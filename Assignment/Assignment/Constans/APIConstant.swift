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
    static let kSEARCH_CONTRIBUTORS     = (urlString: "/repos/", identifier: "2")
    static let kSEARCH_ISSUES     = (urlString: "/search/issues?q=", identifier: "3")
    
    static let kSEARCH_SORTING_ORDER = "&sort=stars&order=desc"
    static let kISSUE_SORTING_ORDER = "&sort=created&order=desc&per_page=3"
    static let kCONTRIBUTOR_SORTING_ORDER = "/contributors?q=contributions&order=desc&per_page=3"
    
}

struct APIHeadersKeyAndValue {
    
    static let kAuthKey = "Accept"
    static let kAuthKeyValue = "application/vnd.github.cloak-preview"
    static let kContentType = "Content-Type"
    static let kContentValue = "application/json"
    
}
