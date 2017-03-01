//
//  MockHTTPCookieStorage.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/28/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation

public class MockHTTPCookieStorage: HTTPCookieStorage {

    public var factory = MockHTTPCookieFactory()
    public var smsessionHTTPCookieFixturePath = "Fixtures/SMSESSIONCookie.json"
    public var httpCookiesFixturePath = "Fixtures/Cookies.json"
    
    /// Use to verify instance "expect..method toHaveBeenCalled
    public var callToMethod: Dictionary <String, Bool> = [
        "cookies": false,
        "cookies:for": false,
        "setCookie": false,
        "setCookies": false,
        "setCookies:for": false
    ]
    
    /// Use to verify class "expect..method toHaveBeenCalled
    public static var callToMethod: Dictionary<String, Bool> = [
        "shared": false
    ]

    override public var cookies: [HTTPCookie]? {
        get {
            self.callToMethod["cookies"] = true
            return self.factory.mockHTTPCookies()
        }
    }

    override public func cookies(for URL: URL) -> [HTTPCookie]? {
        self.callToMethod["cookies:for"] = true
        return self.factory.mockHTTPCookies()
    }
    
    override public func setCookie(_ cookie: HTTPCookie) {
        self.callToMethod["setCookie"] = true
    }
    
    override public func setCookies(_ cookies: [HTTPCookie], for URL: URL?, mainDocumentURL: URL?) {
        self.callToMethod["setCookies:for"] = true
    }

    override public class var shared: HTTPCookieStorage {
        get {
            callToMethod["shared"] = true
            return MockHTTPCookieStorage()
        }
    }
    
}
