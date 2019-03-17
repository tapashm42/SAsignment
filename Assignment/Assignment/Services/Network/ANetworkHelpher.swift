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
        let success: ([Item]?) -> Void = { item in
            DispatchQueue.main.async { _success(item) }
        }
        let failure: (NetworkError) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        let url = "\(APIConstant.kBASE_URL)\(APIConstant.kSEARCH_REPOSITORIES.urlString)\(language)\(APIConstant.kSEARCH_SORTING_ORDER)"
        let requestModel = NetworkRequestModel(url: url,
                                               taskIdentifier: APIConstant.kSEARCH_REPOSITORIES.identifier,
                                               httpMethod: .GET,
                                               body: nil,
                                               headers: [APIHeadersKeyAndValue.kAuthKey:APIHeadersKeyAndValue.kAuthKeyValue])
        let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                
                let dateFormatterWithTime: DateFormatter = self.getDateFormatterWithTime()
                
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

extension ANetworkHelpher{
    
    func getIssuesSpecificToRepository(repoName: String,language: String, success _success: @escaping ([Issue]?) -> Void, failure _failure: @escaping (NetworkError) -> Void) {
        let success: ([Issue]?) -> Void = { issues in
            DispatchQueue.main.async { _success(issues) }
        }
        let failure: (NetworkError) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        let url = "\(APIConstant.kBASE_URL)\(APIConstant.kSEARCH_ISSUES.urlString)\(repoName)+label:bug+language:\(language)+state:open\(APIConstant.kISSUE_SORTING_ORDER)"
        let requestModel = NetworkRequestModel(url: url,
                                               taskIdentifier: APIConstant.kSEARCH_ISSUES.identifier,
                                               httpMethod: .GET,
                                               body: nil,
                                               headers: [APIHeadersKeyAndValue.kAuthKey:APIHeadersKeyAndValue.kAuthKeyValue])
        let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                
                let dateFormatterWithTime: DateFormatter = self.getDateFormatterWithTime()

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
                
                let repoIssueModel = try? decoder.decode(RepoIssueModel.self, from: data!)
                if let incompleteResults = repoIssueModel?.incompleteResults {
                    if !incompleteResults {
                        success(repoIssueModel?.issues)
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
    
    func cancelIssuesRepositories() {
        self.cancelOperation(identifier: APIConstant.kSEARCH_ISSUES.identifier)
    }
}


extension ANetworkHelpher{
    
    func getContributorsSpecificToRepository(query: String, success _success: @escaping ([Item]?) -> Void, failure _failure: @escaping (NetworkError) -> Void) {
        let success: ([Item]?) -> Void = { contributors in
            DispatchQueue.main.async { _success(contributors) }
        }
        let failure: (NetworkError) -> Void = { error in
            DispatchQueue.main.async { _failure(error) }
        }
        
        let url = "\(APIConstant.kBASE_URL)\(APIConstant.kSEARCH_REPOSITORIES.urlString)\(query)\(APIConstant.kSEARCH_SORTING_ORDER)"
        let requestModel = NetworkRequestModel(url: url,
                                               taskIdentifier: APIConstant.kSEARCH_REPOSITORIES.identifier,
                                               httpMethod: .GET,
                                               body: nil,
                                               headers: [APIHeadersKeyAndValue.kAuthKey:APIHeadersKeyAndValue.kAuthKeyValue])
        let networkOperation = NetworkOperation(model: requestModel) { (model, data, response, error, statusCode, isSuccess) in
            if isSuccess {
                
                let dateFormatterWithTime: DateFormatter = self.getDateFormatterWithTime()

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
    
    func cancelRepositories() {
        self.cancelOperation(identifier: APIConstant.kSEARCH_REPOSITORIES.identifier)
    }
}

extension ANetworkHelpher{
    func getDateFormatterWithTime() -> DateFormatter{
        let dateFormatterWithTime: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return formatter
        }()
        return dateFormatterWithTime
    }
}


