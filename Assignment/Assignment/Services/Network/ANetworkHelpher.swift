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
   fileprivate  lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.itcinfotech.NetworkingQueue"
        queue.maxConcurrentOperationCount = 5
        return queue
    }()
    
}

extension ANetworkHelpher {
    public func privateDownloadQueueTestInstance() -> OperationQueue {
        return self.downloadQueue
    }
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
        let requestModel = NetworkRequestModel(url: url,
                                               taskIdentifier: APIConstant.kSEARCH_REPOSITORIES.identifier,
                                               httpMethod: .GET,
                                               body: nil,
                                               headers: [APIHeadersKeyAndValue.kAuthKey:APIHeadersKeyAndValue.kAuthKeyValue])
        let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                
                let dateFormatterWithTime: DateFormatter = {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    return formatter
                }()
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                    let container = try decoder.singleValueContainer()
                    let dateStr = try container.decode(String.self)
                    var date: Date? = nil
                    date = dateFormatterWithTime.date(from: dateStr)
                    guard let date_ = date else {
                        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
                    }
                    return date_
                })
                
                let languageRepoResponse = try? decoder.decode(LanguageRepositoryResponse.self, from: data!)
                if let incompleteResults = languageRepoResponse?.incompleteResults {
                    if !incompleteResults {
                        success(languageRepoResponse?.items)
                    } else {
                        failure(NetworkError.init(statusCode: Int(truncating: NSNumber(value:incompleteResults))))
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
        self.cancelOperation(identifier: APIConstant.kSEARCH_REPOSITORIES.identifier)
    }
}

