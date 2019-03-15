//
//  LanguageRepoResponse.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct LanguageRepositoryResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Item: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let itemPrivate: Bool
    let owner: Owner
    let htmlURL: String
    let description: String
    let fork: Bool
    var url, forksURL: String
    let keysURL, collaboratorsURL: String
    
    let teamsURL, hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL, branchesURL: String
    let tagsURL: String
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String
    let statusesURL: String
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
    let subscriptionURL: String
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String
    let contentsURL, compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String
    let labelsURL, releasesURL: String
    
    let deploymentsURL: String
    let createdAt, updatedAt, pushedAt: Date
    let gitURL, sshURL: String
    let cloneURL: String
    let svnURL: String
    let homepage: String?
    let size, stargazersCount, watchersCount: Int
    let language: Language
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    let hasPages: Bool
    let forksCount: Int
    let mirrorURL: String?
    let archived: Bool
    let openIssuesCount: Int
    let license: License?
    let forks, openIssues, watchers: Int
    let defaultBranch: DefaultBranch
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description, fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived
        case openIssuesCount = "open_issues_count"
        case license, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case score
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //so on...
        id = try values.decode(Int.self, forKey: .id)
        nodeID = try values.decode(String.self, forKey: .nodeID)
        name = try values.decode(String.self, forKey: .name)
        fullName = try values.decode(String.self, forKey: .fullName)
        itemPrivate = try values.decode(Bool.self, forKey: .itemPrivate)
        owner = try values.decode(Owner.self, forKey: .owner)
        htmlURL = try values.decode(String.self, forKey: .htmlURL)
        description = try values.decode(String.self, forKey: .description)
        fork = try values.decode(Bool.self, forKey: .fork)
        url = try values.decode(String.self, forKey: .url)
        forksURL = try values.decode(String.self, forKey: .forksURL)
        keysURL = try values.decode(String.self, forKey: .keysURL)
        collaboratorsURL = try values.decode(String.self, forKey: .collaboratorsURL)
        teamsURL = try values.decode(String.self, forKey: .teamsURL)
        hooksURL = try values.decode(String.self, forKey: .hooksURL)
        issueEventsURL = try values.decode(String.self, forKey: .issueEventsURL)
        eventsURL = try values.decode(String.self, forKey: .eventsURL)
        assigneesURL = try values.decode(String.self, forKey: .assigneesURL)
        branchesURL = try values.decode(String.self, forKey: .branchesURL)
        tagsURL = try values.decode(String.self, forKey: .tagsURL)
        blobsURL = try values.decode(String.self, forKey: .blobsURL)
        gitTagsURL = try values.decode(String.self, forKey: .gitTagsURL)
        gitRefsURL = try values.decode(String.self, forKey: .gitRefsURL)
        treesURL = try values.decode(String.self, forKey: .treesURL)
        statusesURL = try values.decode(String.self, forKey: .statusesURL)
        languagesURL = try values.decode(String.self, forKey: .languagesURL)
        stargazersURL = try values.decode(String.self, forKey: .stargazersURL)
        contributorsURL = try values.decode(String.self, forKey: .contributorsURL)
        subscribersURL = try values.decode(String.self, forKey: .subscribersURL)
        subscriptionURL = try values.decode(String.self, forKey: .subscriptionURL)
        commitsURL = try values.decode(String.self, forKey: .commitsURL)
        gitCommitsURL = try values.decode(String.self, forKey: .gitCommitsURL)
        commentsURL = try values.decode(String.self, forKey: .commentsURL)
        issueCommentURL = try values.decode(String.self, forKey: .issueCommentURL)
        contentsURL = try values.decode(String.self, forKey: .contentsURL)
        compareURL = try values.decode(String.self, forKey: .compareURL)
        mergesURL = try values.decode(String.self, forKey: .mergesURL)
        archiveURL = try values.decode(String.self, forKey: .archiveURL)
        downloadsURL = try values.decode(String.self, forKey: .downloadsURL)
        issuesURL = try values.decode(String.self, forKey: .issuesURL)
        pullsURL = try values.decode(String.self, forKey: .pullsURL)
        milestonesURL = try values.decode(String.self, forKey: .milestonesURL)
        notificationsURL = try values.decode(String.self, forKey: .notificationsURL)
        labelsURL = try values.decode(String.self, forKey: .labelsURL)
        releasesURL = try values.decode(String.self, forKey: .releasesURL)
        deploymentsURL = try values.decode(String.self, forKey: .deploymentsURL)
        createdAt = try values.decode(Date.self, forKey: .createdAt)
        updatedAt = try values.decode(Date.self, forKey: .updatedAt)
        pushedAt = try values.decode(Date.self, forKey: .pushedAt)
        gitURL = try values.decode(String.self, forKey: .gitURL)
        sshURL = try values.decode(String.self, forKey: .sshURL)
        cloneURL = try values.decode(String.self, forKey: .cloneURL)
        svnURL = try values.decode(String.self, forKey: .svnURL)
        if let _homepage = try? values.decode(String.self, forKey: .homepage) {
            homepage = _homepage
        } else {
            homepage = ""
        }
        size = try values.decode(Int.self, forKey: .size)
        stargazersCount = try values.decode(Int.self, forKey: .stargazersCount)
        watchersCount = try values.decode(Int.self, forKey: .watchersCount)
        language = try values.decode(Language.self, forKey: .language)
        hasIssues = try values.decode(Bool.self, forKey: .hasIssues)
        hasProjects = try values.decode(Bool.self, forKey: .hasProjects)
        hasDownloads = try values.decode(Bool.self, forKey: .hasDownloads)
        hasWiki = try values.decode(Bool.self, forKey: .hasWiki)
        hasPages = try values.decode(Bool.self, forKey: .hasPages)
        archived = try values.decode(Bool.self, forKey: .archived)
        forksCount = try values.decode(Int.self, forKey: .forksCount)
        if let _mirrorURL = try? values.decode(String.self, forKey: .mirrorURL) {
            mirrorURL = _mirrorURL
        } else {
            mirrorURL = ""
        }
        openIssuesCount = try values.decode(Int.self, forKey: .openIssuesCount)
        if let _license = try? values.decode(License.self, forKey: .license) {
            license = _license
        } else {
            license = nil
        }
        forks = try values.decode(Int.self, forKey: .forks)
        openIssues = try values.decode(Int.self, forKey: .openIssues)
        watchers = try values.decode(Int.self, forKey: .watchers)
        defaultBranch = try values.decode(DefaultBranch.self, forKey: .defaultBranch)
        score = try values.decode(Int.self, forKey: .score)

    }
    
}

enum DefaultBranch: String, Codable {
    case develop = "develop"
    case master = "master"
}

enum Language: String, Codable {
    case swift = "Swift"
}

struct License: Codable {
    let key, name, spdxID: String
    let url: String?
    let nodeID: String
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decode(String.self, forKey: .key)
        name = try values.decode(String.self, forKey: .name)
        spdxID = try values.decode(String.self, forKey: .spdxID)
        if let _url = try? values.decode(String.self, forKey: .url) {
            url = _url
        } else {
            url = ""
        }
        nodeID = try values.decode(String.self, forKey: .nodeID)
    }
}

struct Owner: Codable {
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
    case organization = "Organization"
    case user = "User"
}

// MARK: Encode/decode helpers

/*class JSONNull: Codable, Hashable {
    
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}*/
