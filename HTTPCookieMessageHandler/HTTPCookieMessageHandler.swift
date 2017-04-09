//
//  HTTPCookieMessageHandler.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/26/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation

public class HTTPCookieMessageHandler: MessageHandler {

    public typealias ItemType = HTTPCookie

    //public typealias StorageItemType = HTTPCookieStorage

    private var defaultSaveAllOptions: [String: String] = [
        "forUrl": "https://verizon.com"
    ]

    public var message: HTTPCookieMessage

    public var dataStore: HTTPCookieStorage!

    public init(acceptPolicy: ItemType.AcceptPolicy? = ItemType.AcceptPolicy.always,
                dataStore: HTTPCookieStorage? = nil) {
        if dataStore != nil {
            self.dataStore = dataStore!
        } else {
            self.dataStore = HTTPCookieStorage.shared
        }
        self.dataStore.cookieAcceptPolicy = acceptPolicy!
        message = HTTPCookieMessage("/auth/sessions/all/smsession/token")
    }

    /// Iterates over elements of an array and returning the first element
    /// that the callback returns true for.
    ///
    /// - parameter options: A dictionary of named values.
    /// - parameter callbackPredicate: The callback function to tell whether element is found.
    /// - returns: Optional containing either found element or nil.
    public func find(_ options: [String: Any]? = nil, _ callbackPredicate: (ItemType) -> Bool) -> ItemType? {
        var cookies: [ItemType]
        if let url = makeURL(options) {
            cookies = dataStore.cookies(for: url)!
        } else {
            cookies = dataStore.cookies!
        }
        let results = cookies.filter { return callbackPredicate($0) }
        return (results.isEmpty) ? .none : results.first!
    }

    public func save(item: ItemType) {
        let cookie = item
        self.dataStore.setCookie(cookie)
    }

    public func save(_ options: [String: Any]? = nil, items: [ItemType]) {
        let url = makeURL(options)
        dataStore.setCookies(items, for: url, mainDocumentURL: nil)
    }

    internal func makeURL(_ options: [String: Any]?) -> URL? {
        if let urlString = options?["forUrl"] as? String? {
            return URL(string: urlString!)
        }
        return .none
    }
}
