//
//  RepoIssueModel.swift
//  Assignment
//
//  Created by TapashM on 17/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct RepoIssueModel: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let issues: [Issue]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case issues = "items"
    }
}

struct Issue: Codable {
    let url: String?
    let repositoryURL: String?
    let labelsURL: String?
    let commentsURL, eventsURL, htmlURL: String?
    let id: Int?
    let nodeID: String?
    let number: Int?
    let title: String?
    let user: User
    let labels: [Label]?
    let state: State
    let locked: Bool?
    let assignee: User?
    let assignees: [User]?
    let milestone: String?
    let comments: Int?
    let createdAt, updatedAt: Date?
    let closedAt: String?
    let authorAssociation: AuthorAssociation?
    let body: String?
    let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number, title, user, labels, state, locked, assignee, assignees, milestone, comments
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case authorAssociation = "author_association"
        case body, score
    }
    
    init(from decodeIfPresentr: Decoder) throws {
        let values = try decodeIfPresentr.container(keyedBy: CodingKeys.self)
        
        url = try? values.decodeIfPresent(String.self, forKey: .url) ?? ""
        repositoryURL = try? values.decodeIfPresent(String.self, forKey: .repositoryURL) ?? ""
        labelsURL = try? values.decodeIfPresent(String.self, forKey: .labelsURL) ?? ""
        commentsURL = try? values.decodeIfPresent(String.self, forKey: .commentsURL) ?? ""
        eventsURL = try? values.decodeIfPresent(String.self, forKey: .eventsURL) ?? ""
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL) ?? ""
        id = try? values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID) ?? ""
        number = try? values.decodeIfPresent(Int.self, forKey: .number) ?? 0
        title = try? values.decodeIfPresent(String.self, forKey: .title) ?? ""
        user = try values.decode(User.self, forKey: .user)
        labels = try values.decodeIfPresent([Label].self, forKey: .labels)
        state = try values.decode(State.self, forKey: .state)
        locked = try? values.decodeIfPresent(Bool.self, forKey: .locked) ?? false
        assignee = try values.decodeIfPresent(User.self, forKey: .assignee)
        assignees = try values.decodeIfPresent([User].self, forKey: .assignees)
        milestone = try? values.decodeIfPresent(String.self, forKey: .milestone) ?? ""
        comments = try? values.decodeIfPresent(Int.self, forKey: .comments) ?? 0
        createdAt = try values.decodeIfPresent(Date.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(Date.self, forKey: .updatedAt)
        closedAt = try values.decodeIfPresent(String.self, forKey: .closedAt)
        authorAssociation = try values.decodeIfPresent(AuthorAssociation.self, forKey: .authorAssociation)
        body = try values.decodeIfPresent(String.self, forKey: .body) ?? ""
        score = try? values.decodeIfPresent(Double.self, forKey: .score) ?? 0.0
    }
}

struct User: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: TypeEnum
    let siteAdmin: Bool?
    
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
    
    init(from decodeIfPresentr: Decoder) throws {
        let values = try decodeIfPresentr.container(keyedBy: CodingKeys.self)
        
        login = try? values.decodeIfPresent(String.self, forKey: .login) ?? ""
        id = try? values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID) ?? ""
        avatarURL = try? values.decodeIfPresent(String.self, forKey: .avatarURL) ?? ""
        gravatarID = try? values.decodeIfPresent(String.self, forKey: .gravatarID) ?? ""
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL) ?? ""
        url = try? values.decodeIfPresent(String.self, forKey: .url) ?? ""
        followersURL = try? values.decodeIfPresent(String.self, forKey: .followersURL) ?? ""
        followingURL = try? values.decodeIfPresent(String.self, forKey: .followingURL) ?? ""
        gistsURL = try? values.decodeIfPresent(String.self, forKey: .gistsURL) ?? ""
        starredURL = try? values.decodeIfPresent(String.self, forKey: .starredURL) ?? ""
        subscriptionsURL = try? values.decodeIfPresent(String.self, forKey: .subscriptionsURL) ?? ""
        organizationsURL = try? values.decodeIfPresent(String.self, forKey: .organizationsURL) ?? ""
        reposURL = try? values.decodeIfPresent(String.self, forKey: .reposURL) ?? ""
        eventsURL = try? values.decodeIfPresent(String.self, forKey: .eventsURL) ?? ""
        receivedEventsURL = try? values.decodeIfPresent(String.self, forKey: .receivedEventsURL) ?? ""
        type = try values.decode(TypeEnum.self, forKey: .type)
        siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin) ?? false
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
    let id: Int?
    let nodeID: String?
    let url: String?
    let name, color: String?
    let labelDefault: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url, name, color
        case labelDefault = "default"
    }
    
    init(from decodeIfPresentr: Decoder) throws {
        let values = try decodeIfPresentr.container(keyedBy: CodingKeys.self)
        
        id = try? values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID) ?? ""
        url = try? values.decodeIfPresent(String.self, forKey: .url) ?? ""
        name = try? values.decodeIfPresent(String.self, forKey: .name) ?? ""
        color = try? values.decodeIfPresent(String.self, forKey: .color) ?? ""
        labelDefault = try? values.decodeIfPresent(Bool.self, forKey: .labelDefault) ?? false
    }
}

enum State: String, Codable {
    case stateOpen = "open"
}
