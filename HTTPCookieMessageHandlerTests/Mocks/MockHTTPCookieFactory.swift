//
//  MockCookieFactory.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/28/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation
import SwiftyJSON

public class MockHTTPCookieFactory {

  let TEST_DIR: String = "/Users/v128477/Projects/sandbox/sso/ios/swift/HTTPCookieMessageHandler/CookieMessageHandlerTests"

  public var fixtureFilePath: String!

  public init() {
    self.fixtureFilePath = String(describing: TEST_DIR + "/Fixtures/Cookies.json")
  }

  public func makeHTTPCookieMocks() -> [HTTPCookie] {
    let smsessionDictionary: [HTTPCookiePropertyKey: Any] = [
      HTTPCookiePropertyKey.name: "SMSESSION",
      HTTPCookiePropertyKey.value: "1",
      HTTPCookiePropertyKey.domain: "verizon.com",
      HTTPCookiePropertyKey.path: "/",
      HTTPCookiePropertyKey.secure: true
    ]
    let persistentDictionary: [HTTPCookiePropertyKey: Any] = [
      HTTPCookiePropertyKey.name: "__invasive_marketing_spy",
      HTTPCookiePropertyKey.value: "the-number-of-the-beast",
      HTTPCookiePropertyKey.domain: "yoyodyne.com",
      HTTPCookiePropertyKey.path: "/",
      HTTPCookiePropertyKey.secure: false,
      HTTPCookiePropertyKey.expires: Date.distantFuture,
      HTTPCookiePropertyKey(rawValue: "HttpOnly"): true
    ]
    let smsessionHTTPCookie = HTTPCookie(properties: smsessionDictionary)
    let persistentHTTPCookie = HTTPCookie(properties: persistentDictionary)
    let mockCookies: [HTTPCookie] = [
      smsessionHTTPCookie!,
      persistentHTTPCookie!
    ]
    return mockCookies
  }

  public func makeFixtures() -> [HTTPCookie] {
    var cookieFixture: [HTTPCookie] = []
    let cookieStrings: String = cookieFixturesFromFile()
    if let dataFromString = cookieStrings.data(using: .utf8, allowLossyConversion: false) {
      let json = JSON(data: dataFromString)
      cookieFixture = json.arrayObject! as! [HTTPCookie]
      for cookie in json.arrayObject! {
        cookieFixture.append(cookie as! HTTPCookie)
      }
    }
    return cookieFixture
  }

  internal func cookieFixturesFromFile() -> String {
    return try! String(contentsOfFile: self.fixtureFilePath, encoding: .utf8)
  }

}
