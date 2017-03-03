//
//  MockHTTPCookieStorage.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/28/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation
import Quick

public class MockHTTPCookieStorage: HTTPCookieStorage {

  public var factory = MockHTTPCookieFactory()
  public var smsessionHTTPCookieFixturePath = "Fixtures/SMSESSIONCookie.json"
  public var httpCookiesFixturePath = "Fixtures/Cookies.json"

  public var called: [String:Bool]! = [
    "setCookie": false,
    "setCookies:for": false,
    "cookies": false,
    "cookies:for": false,
    "shared": false
  ]

  override public var cookies: [HTTPCookie]? {
    get {
      called["cookies"] = true
      return factory.makeHTTPCookieMocks()
    }
  }

  override public func cookies(for URL: URL) -> [HTTPCookie]? {
    called["cookies:for"] = true
    return self.factory.makeHTTPCookieMocks()
  }

  override public func setCookie(_ cookie: HTTPCookie) {
    called["setCookie"] = true
  }

  override public func setCookies(_ cookies: [HTTPCookie], for URL: URL?, mainDocumentURL: URL?) {
    called["setCookie:for"] = true
  }

}
