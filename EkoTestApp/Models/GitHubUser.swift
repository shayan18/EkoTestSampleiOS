//
//  GitHubUser.swift
//
//  Created by Shayan Ali on 15/12/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
public struct GitHubUser {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let organizationsUrl = "organizations_url"
    static let reposUrl = "repos_url"
    static let htmlUrl = "html_url"
    static let siteAdmin = "site_admin"
    static let gravatarId = "gravatar_id"
    static let starredUrl = "starred_url"
    static let avatarUrl = "avatar_url"
    static let type = "type"
    static let gistsUrl = "gists_url"
    static let login = "login"
    static let followersUrl = "followers_url"
    static let id = "id"
    static let subscriptionsUrl = "subscriptions_url"
    static let followingUrl = "following_url"
    static let receivedEventsUrl = "received_events_url"
    static let nodeId = "node_id"
    static let url = "url"
    static let eventsUrl = "events_url"
  }

  // MARK: Properties
  public var organizationsUrl: String?
  public var reposUrl: String?
  public var htmlUrl: String?
  public var siteAdmin: Bool? = false
  public var gravatarId: String?
  public var starredUrl: String?
  public var avatarUrl: String?
  public var type: String?
  public var gistsUrl: String?
  public var login: String?
  public var followersUrl: String?
  public var id: Int?
  public var subscriptionsUrl: String?
  public var followingUrl: String?
  public var receivedEventsUrl: String?
  public var nodeId: String?
  public var url: String?
  public var eventsUrl: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    organizationsUrl = json[SerializationKeys.organizationsUrl].string
    reposUrl = json[SerializationKeys.reposUrl].string
    htmlUrl = json[SerializationKeys.htmlUrl].string
    siteAdmin = json[SerializationKeys.siteAdmin].boolValue
    gravatarId = json[SerializationKeys.gravatarId].string
    starredUrl = json[SerializationKeys.starredUrl].string
    avatarUrl = json[SerializationKeys.avatarUrl].string
    type = json[SerializationKeys.type].string
    gistsUrl = json[SerializationKeys.gistsUrl].string
    login = json[SerializationKeys.login].string
    followersUrl = json[SerializationKeys.followersUrl].string
    id = json[SerializationKeys.id].int
    subscriptionsUrl = json[SerializationKeys.subscriptionsUrl].string
    followingUrl = json[SerializationKeys.followingUrl].string
    receivedEventsUrl = json[SerializationKeys.receivedEventsUrl].string
    nodeId = json[SerializationKeys.nodeId].string
    url = json[SerializationKeys.url].string
    eventsUrl = json[SerializationKeys.eventsUrl].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = organizationsUrl { dictionary[SerializationKeys.organizationsUrl] = value }
    if let value = reposUrl { dictionary[SerializationKeys.reposUrl] = value }
    if let value = htmlUrl { dictionary[SerializationKeys.htmlUrl] = value }
    dictionary[SerializationKeys.siteAdmin] = siteAdmin
    if let value = gravatarId { dictionary[SerializationKeys.gravatarId] = value }
    if let value = starredUrl { dictionary[SerializationKeys.starredUrl] = value }
    if let value = avatarUrl { dictionary[SerializationKeys.avatarUrl] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = gistsUrl { dictionary[SerializationKeys.gistsUrl] = value }
    if let value = login { dictionary[SerializationKeys.login] = value }
    if let value = followersUrl { dictionary[SerializationKeys.followersUrl] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = subscriptionsUrl { dictionary[SerializationKeys.subscriptionsUrl] = value }
    if let value = followingUrl { dictionary[SerializationKeys.followingUrl] = value }
    if let value = receivedEventsUrl { dictionary[SerializationKeys.receivedEventsUrl] = value }
    if let value = nodeId { dictionary[SerializationKeys.nodeId] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = eventsUrl { dictionary[SerializationKeys.eventsUrl] = value }
    return dictionary
  }

}
