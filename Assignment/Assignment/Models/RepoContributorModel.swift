//
//  RepoContributorModel.swift
//  Assignment
//
//  Created by TapashM on 17/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct RepoContributorModel: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let contributors: [Contributor]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case contributors
    }
}

struct Contributor: Codable {
    let url: String
    let repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let id: Int
    let nodeID: String
//    let number: Int
//    let title: String
//    let user: User
//    let labels: [Label]
//    let state: State
//    let locked: Bool
//    let assignee: User?
//    let assignees: [User]
//    let milestone: JSONNull?
//    let comments: Int
//    let createdAt, updatedAt: Date
//    let closedAt: JSONNull?
//    let authorAssociation: AuthorAssociation
    let body: String
    let score: Double
    
    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
//        case number, title, user, labels, state, locked, assignee, assignees, milestone, comments
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case closedAt = "closed_at"
//        case authorAssociation = "author_association"
        case body, score
    }
}

/*
struct User: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum TypeEnum: String, Codable {
    case user = "User"
}

enum AuthorAssociation: String, Codable {
    case collaborator = "COLLABORATOR"
    case contributor = "CONTRIBUTOR"
    case member = "MEMBER"
    case none = "NONE"
    case owner = "OWNER"
}

struct Label: Codable {
    let id: Int
    let nodeID: String
    let url: String
    let name, color: String
    let labelDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url, name, color
        case labelDefault = "default"
    }
}

enum State: String, Codable {
    case stateOpen = "open"
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
}
*/
