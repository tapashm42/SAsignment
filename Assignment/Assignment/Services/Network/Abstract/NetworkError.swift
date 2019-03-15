//
//  NetworkError.swift
//  Assignment
//
//  Created by TapashM on 15/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    
    case notProcessed(String)
    case noRecords
    case notAValidJSON
    case noKeyValuePairFound
    case unauthorizedUser
    case authRequired
    case serverError
    case forbidden
    case incompleteResult
    case timeout
    case requestFailure
    case networkProblem(Error)
    case requestNotReachingToServer
    case unknown(HTTPURLResponse?)
    case userCancelled
    
    public init(statusCode: Int?) {
        
        if let mStatusCode = statusCode {
            
            switch mStatusCode {
            case NetworkError.notProcessed("").statusCode: self     = .notProcessed("")
            case NetworkError.noRecords.statusCode: self        = .noRecords
            case NetworkError.unauthorizedUser.statusCode: self = .unauthorizedUser
            case NetworkError.authRequired.statusCode: self     = .authRequired
            case NetworkError.forbidden.statusCode: self        = .forbidden
            case NetworkError.incompleteResult.statusCode: self         = .incompleteResult
            case NetworkError.serverError.statusCode: self      = .serverError
            case NetworkError.timeout.statusCode: self          = .timeout
            case NetworkError.notAValidJSON.statusCode: self = .notAValidJSON
            case NetworkError.noKeyValuePairFound.statusCode: self        = .noKeyValuePairFound
            case NetworkError.requestNotReachingToServer.statusCode: self = .requestNotReachingToServer
            case NetworkError.requestFailure.statusCode: self = .requestFailure
                
            default: self = .requestNotReachingToServer
            }
        } else {
            self = .requestNotReachingToServer
        }
    }
    
    public init(error: Error) {
        self = .networkProblem(error)
    }
    
    public init(response: URLResponse?) {
        guard let response = response as? HTTPURLResponse else {
            self = .unknown(nil)
            return
        }
        
        switch response.statusCode {
        case NetworkError.notProcessed("").statusCode: self     = .notProcessed("")
        case NetworkError.noRecords.statusCode: self        = .noRecords
        case NetworkError.unauthorizedUser.statusCode: self = .unauthorizedUser
        case NetworkError.authRequired.statusCode: self     = .authRequired
        case NetworkError.forbidden.statusCode: self        = .forbidden
        case NetworkError.incompleteResult.statusCode: self         = .incompleteResult
        case NetworkError.serverError.statusCode: self      = .serverError
        case NetworkError.timeout.statusCode: self          = .timeout
        case NetworkError.noKeyValuePairFound.statusCode: self = .noKeyValuePairFound
        case NetworkError.notAValidJSON.statusCode: self = .notAValidJSON
        case NetworkError.requestNotReachingToServer.statusCode: self = .requestNotReachingToServer
        default: self = .unknown(response)
            
        }
    }
    
    public var isAuthError: Bool {
        switch self {
        case .unauthorizedUser: return true
        default: return false
        }
    }
    
    public var statusCode: Int {
        switch self {
        case .noRecords:         return 204
        case .notProcessed(_):   return 300
        case .unauthorizedUser:  return 401
        case .forbidden:         return 403
        case .incompleteResult:          return 404
        case .authRequired:      return 407
        case .serverError:       return 500
        case .timeout:           return -1001
        case .networkProblem(_): return 10001
        case .unknown(_):        return 10002
        case .userCancelled:     return 99999
        case .noKeyValuePairFound: return 5001
        case .notAValidJSON:       return 5002
        case .requestFailure:          return 5010
        case .requestNotReachingToServer: return 10001
            
        }
    }
}

// MARK: - Equatable
extension NetworkError: Equatable {
    public static func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
}

