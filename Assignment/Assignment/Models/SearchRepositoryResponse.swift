//
//  LanguageRepoResponse.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation

struct SearchRepositoryResponse: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Item: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let itemPrivate: Bool!
    let owner: Owner
    let htmlURL: String?
    let description: String?
    let fork: Bool!
    var url, forksURL: String?
    let keysURL, collaboratorsURL: String?
    
    let teamsURL, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    
    let deploymentsURL: String?
    let createdAt, updatedAt, pushedAt: Date?
    let gitURL, sshURL: String?
    let cloneURL: String?
    let svnURL: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let hasIssues: Bool!
    let  hasProjects: Bool!
    let  hasDownloads: Bool!
    let  hasWiki: Bool!

    let hasPages: Bool!
    let forksCount: Int?
    let mirrorURL: String?
    let archived: Bool!
    let openIssuesCount: Int?
    let license: License?
    let forks, openIssues, watchers: Int?
    let defaultBranch: String?
    let score: Int?
    
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
    
    init(from decodeIfPresentr: Decoder) throws {
        let values = try decodeIfPresentr.container(keyedBy: CodingKeys.self)
        
        id = try? values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID) ?? ""
        name = try? values.decodeIfPresent(String.self, forKey: .name) ?? ""
        fullName = try? values.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        itemPrivate = try values.decodeIfPresent(Bool.self, forKey: .itemPrivate) ?? false
        owner = try values.decode(Owner.self, forKey: .owner)
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL) ?? ""
        description = try? values.decodeIfPresent(String.self, forKey: .description) ?? ""
        fork = try values.decodeIfPresent(Bool.self, forKey: .fork) ?? false
        url = try? values.decodeIfPresent(String.self, forKey: .url) ?? ""
        forksURL = try? values.decodeIfPresent(String.self, forKey: .forksURL) ?? ""
        keysURL = try? values.decodeIfPresent(String.self, forKey: .keysURL) ?? ""
        collaboratorsURL = try? values.decodeIfPresent(String.self, forKey: .collaboratorsURL) ?? ""
        teamsURL = try? values.decodeIfPresent(String.self, forKey: .teamsURL) ?? ""
        hooksURL = try? values.decodeIfPresent(String.self, forKey: .hooksURL) ?? ""
        issueEventsURL = try? values.decodeIfPresent(String.self, forKey: .issueEventsURL) ?? ""
        eventsURL = try? values.decodeIfPresent(String.self, forKey: .eventsURL) ?? ""
        assigneesURL = try? values.decodeIfPresent(String.self, forKey: .assigneesURL) ?? ""
        branchesURL = try? values.decodeIfPresent(String.self, forKey: .branchesURL) ?? ""
        tagsURL = try? values.decodeIfPresent(String.self, forKey: .tagsURL) ?? ""
        blobsURL = try? values.decodeIfPresent(String.self, forKey: .blobsURL) ?? ""
        gitTagsURL = try? values.decodeIfPresent(String.self, forKey: .gitTagsURL) ?? ""
        gitRefsURL = try? values.decodeIfPresent(String.self, forKey: .gitRefsURL) ?? ""
        treesURL = try? values.decodeIfPresent(String.self, forKey: .treesURL) ?? ""
        statusesURL = try? values.decodeIfPresent(String.self, forKey: .statusesURL) ?? ""
        languagesURL = try? values.decodeIfPresent(String.self, forKey: .languagesURL) ?? ""
        stargazersURL = try? values.decodeIfPresent(String.self, forKey: .stargazersURL) ?? ""
        contributorsURL = try? values.decodeIfPresent(String.self, forKey: .contributorsURL) ?? ""
        subscribersURL = try? values.decodeIfPresent(String.self, forKey: .subscribersURL) ?? ""
        subscriptionURL = try? values.decodeIfPresent(String.self, forKey: .subscriptionURL) ?? ""
        commitsURL = try? values.decodeIfPresent(String.self, forKey: .commitsURL) ?? ""
        gitCommitsURL = try? values.decodeIfPresent(String.self, forKey: .gitCommitsURL) ?? ""
        commentsURL = try? values.decodeIfPresent(String.self, forKey: .commentsURL) ?? ""
        issueCommentURL = try? values.decodeIfPresent(String.self, forKey: .issueCommentURL) ?? ""
        contentsURL = try? values.decodeIfPresent(String.self, forKey: .contentsURL) ?? ""
        compareURL = try? values.decodeIfPresent(String.self, forKey: .compareURL) ?? ""
        mergesURL = try? values.decodeIfPresent(String.self, forKey: .mergesURL) ?? ""
        archiveURL = try? values.decodeIfPresent(String.self, forKey: .archiveURL) ?? ""
        downloadsURL = try? values.decodeIfPresent(String.self, forKey: .downloadsURL) ?? ""
        issuesURL = try? values.decodeIfPresent(String.self, forKey: .issuesURL) ?? ""
        pullsURL = try? values.decodeIfPresent(String.self, forKey: .pullsURL) ?? ""
        milestonesURL = try? values.decodeIfPresent(String.self, forKey: .milestonesURL) ?? ""
        notificationsURL = try? values.decodeIfPresent(String.self, forKey: .notificationsURL) ?? ""
        labelsURL = try? values.decodeIfPresent(String.self, forKey: .labelsURL) ?? ""
        releasesURL = try? values.decodeIfPresent(String.self, forKey: .releasesURL) ?? ""
        deploymentsURL = try? values.decodeIfPresent(String.self, forKey: .deploymentsURL) ?? ""
        createdAt = try values.decodeIfPresent(Date.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(Date.self, forKey: .updatedAt)
        pushedAt = try values.decodeIfPresent(Date.self, forKey: .pushedAt)
        gitURL = try? values.decodeIfPresent(String.self, forKey: .gitURL) ?? ""
        sshURL = try? values.decodeIfPresent(String.self, forKey: .sshURL) ?? ""
        cloneURL = try? values.decodeIfPresent(String.self, forKey: .cloneURL) ?? ""
        svnURL = try? values.decodeIfPresent(String.self, forKey: .svnURL) ?? ""
        homepage = try? values.decodeIfPresent(String.self, forKey: .homepage) ?? ""
        size = try? values.decodeIfPresent(Int.self, forKey: .size) ?? 0
        stargazersCount = try? values.decodeIfPresent(Int.self, forKey: .stargazersCount) ?? 0
        watchersCount = try? values.decodeIfPresent(Int.self, forKey: .watchersCount) ?? 0
        language = try? values.decodeIfPresent(String.self, forKey: .language) ?? ""
        hasIssues = try values.decodeIfPresent(Bool.self, forKey: .hasIssues) ?? false
        hasProjects = try values.decodeIfPresent(Bool.self, forKey: .hasProjects) ?? false
        hasDownloads = try values.decodeIfPresent(Bool.self, forKey: .hasDownloads) ?? false
         hasWiki = try values.decodeIfPresent(Bool.self, forKey: .hasWiki) ?? false
         hasPages = try values.decodeIfPresent(Bool.self, forKey: .hasPages) ?? false
        archived = try values.decodeIfPresent(Bool.self, forKey: .archived) ?? false
        forksCount = try? values.decodeIfPresent(Int.self, forKey: .forksCount) ?? 0
        mirrorURL = try? values.decodeIfPresent(String.self, forKey: .mirrorURL) ?? ""
        openIssuesCount = try? values.decodeIfPresent(Int.self, forKey: .openIssuesCount) ?? 0
        license = try values.decodeIfPresent(License.self, forKey: .license)
        forks = try? values.decodeIfPresent(Int.self, forKey: .forks) ?? 0
        openIssues = try? values.decodeIfPresent(Int.self, forKey: .openIssues) ?? 0
        watchers = try values.decodeIfPresent(Int.self, forKey: .watchers) ?? 0
        defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch) ?? ""
        score = try? values.decodeIfPresent(Int.self, forKey: .score) ?? 0
    }
}

struct License: Codable {
    let key, name, spdxID: String?
    let url: String?
    let nodeID: String?
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
    
    init(from decodeIfPresentr: Decoder) throws {
        let values = try decodeIfPresentr.container(keyedBy: CodingKeys.self)
        
        key = try? values.decodeIfPresent(String.self, forKey: .key) ?? ""
        name = try? values.decodeIfPresent(String.self, forKey: .name) ?? ""
        spdxID = try? values.decodeIfPresent(String.self, forKey: .spdxID) ?? ""
        url = try? values.decodeIfPresent(String.self, forKey: .url) ?? ""
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID) ?? ""
    }
}

struct Owner: Codable {
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
    let type: String?
    let siteAdmin: Bool!
    
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
        url = try? values.decodeIfPresent(String.self, forKey: .url) ?? ""
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL) ?? ""
        followersURL = try? values.decodeIfPresent(String.self, forKey: .followersURL) ?? ""
        followingURL = try? values.decodeIfPresent(String.self, forKey: .followingURL) ?? ""
        gistsURL = try? values.decodeIfPresent(String.self, forKey: .gistsURL) ?? ""
        starredURL = try? values.decodeIfPresent(String.self, forKey: .starredURL) ?? ""
        subscriptionsURL = try? values.decodeIfPresent(String.self, forKey: .subscriptionsURL) ?? ""
        organizationsURL = try? values.decodeIfPresent(String.self, forKey: .organizationsURL) ?? ""
        reposURL = try? values.decodeIfPresent(String.self, forKey: .reposURL) ?? ""
        eventsURL = try? values.decodeIfPresent(String.self, forKey: .eventsURL) ?? ""
        receivedEventsURL = try? values.decodeIfPresent(String.self, forKey: .receivedEventsURL) ?? ""
        type = try? values.decodeIfPresent(String.self, forKey: .type) ?? ""
        siteAdmin = try? values.decodeIfPresent(Bool.self, forKey: .siteAdmin) ?? false
    }
}

