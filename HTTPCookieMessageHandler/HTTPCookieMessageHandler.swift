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
    
    public typealias StorageItemType = HTTPCookieStorage

    private var defaultSaveAllOptions: Dictionary<String, String> = [
        "forUrl"         : "https://verizon.com"
    ]

    public var dataStore: StorageItemType

    public init(acceptPolicy: HTTPCookie.AcceptPolicy? = HTTPCookie.AcceptPolicy.always) {
        self.dataStore = HTTPCookieStorage.shared
        self.dataStore.cookieAcceptPolicy = acceptPolicy!
    }

    /// Iterates over elements of an array and returning the first element
    /// that the callback returns true for.
    ///
    /// - parameter options: A dictionary of named values.
    /// - parameter callbackPredicate: The callback function to tell whether element is found.
    /// - returns: Optional containing either found element or nil.
    public func find(_ options: Dictionary<String, Any>? = nil, _ callbackPredicate: (ItemType) -> Bool) -> ItemType? {
        var cookies: [ItemType]
        if (options != nil && options?["forUrl"] != nil) {
            let forUrl: String = options?["forUrl"] as! String
            let url: URL = URL(string: String(describing: forUrl))!
            cookies = self.dataStore.cookies(for: url)!
        }
        else {
            cookies = self.dataStore.cookies!
        }
        for cookie in cookies {
            if callbackPredicate (cookie) {
                return cookie
            }
        }
        return .none
    }

    public func save(item: ItemType) {
        let cookie = item
        self.dataStore.setCookie(cookie)
    }

    public func save(_ options: Dictionary<String, Any>? = nil, items: [ItemType]) {

    }
}
