//
//  ANetworkHelpher.swift
//  Assignment
//
//  Created by TapashM on 15/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

final class ANetworkHelpher {
    
    static let shared = ANetworkHelpher()
    private init() { }
    
    // MARK: - Operation Queue
    fileprivate lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.itcinfotech.spiceclubNetworkingQueue"
        queue.maxConcurrentOperationCount = 5
        return queue
    }()
    
}

// MARK: - Cancelling APIs (General)
extension ANetworkHelpher {
    func cancelAll() {
        downloadQueue.cancelAllOperations()
    }
    
    func cancelOperation(identifier: String) {
        for operation in downloadQueue.operations {
            if operation.name == identifier {
                operation.cancel()
            }
        }
    }
}

extension ANetworkHelpher{
    
    func getRepositorySpecificToLanguage(language: String, success _success: @escaping ([Item]?) -> Void, failure _failure: @escaping (NetworkError) -> Void) {
        let success: ([Item]?) -> Void = { wallet in
            DispatchQueue.main.async { _success(wallet) }
        }
        let failure: (NetworkError) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        let url = "\(APIConstant.kBASE_URL)\(APIConstant.kSEARCH_REPOSITORIES.urlString)\(language)\(APIConstant.kSORTING_ORDER)"

        
        print("SEARCH_REPOSITORIES request url: %@",url)
        let requestModel = NetworkRequestModel(url: url,
                                               taskIdentifier: APIConstant.kSEARCH_REPOSITORIES.identifier,
                                               httpMethod: .GET,
                                               body: nil,
                                               headers: [APIHeadersKeyAndValue.kAuthKey:APIHeadersKeyAndValue.kAuthKeyValue])
        let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                //Here it's coming as a string
                let jsonString = String(decoding: data!, as: UTF8.self)
                let jsonData = jsonString.data(using: .utf8)
                print("jsonData:\(jsonData)")
                //Problem is Here languageRepoResponse is nil
                let languageRepoResponse = try? JSONDecoder().decode(LanguageRepositoryResponse.self, from: data!)
                if let incompleteResults = languageRepoResponse?.incompleteResults {
                    if !incompleteResults {
                        print("languageRepoResponse: %@",languageRepoResponse ?? "")
                        
                        success(languageRepoResponse?.items)
                    } else {
                        failure(NetworkError.init(statusCode: Int(truncating: NSNumber(value:incompleteResults))))
                        
                         //1

                    }
                }
                else {
                    failure(NetworkError.notAValidJSON)
                }
                
            } else {
                failure(NetworkError.init(statusCode: nil))
            }
        }
        downloadQueue.addOperations([networkOperation], waitUntilFinished: false)
    }
    
    func cancelSearchRepositories() {
        ANetworkHelpher.shared.cancelOperation(identifier: APIConstant.kSEARCH_REPOSITORIES.identifier)
    }
}

