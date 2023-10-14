
//
//  Contributor.swift
//  Steps
//
//  Created by Drag0ndust on 05.10.23.
//

import Foundation

struct Contributor: Codable, Hashable, Identifiable {
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
    let type: String
    let siteAdmin: Bool
    let contributions: Int

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
        case contributions
    }
}

extension Contributor {
    // TODO: Improve Contributor mock
    static let mock: Self = .init(
        login: "login",
        id: 1,
        nodeID: "nodeID",
        avatarURL: "avatarURL",
        gravatarID: "gravatarID",
        url: "url",
        htmlURL: "htmlURL",
        followersURL: "followersURL",
        followingURL: "followingURL",
        gistsURL: "gistsURL",
        starredURL: "starredURL",
        subscriptionsURL: "subscriptionsURL",
        organizationsURL: "organizationsURL",
        reposURL: "reposURL",
        eventsURL: "eventsURL",
        receivedEventsURL: "receivedEventsURL",
        type: "type",
        siteAdmin: false,
        contributions: 1
    )
}

extension [Contributor] {
    static let mock: Self = [.mock]
}
