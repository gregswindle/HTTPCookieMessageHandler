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
    
    public func mockHTTPCookies() -> Array<HTTPCookie> {
        let smsessionDictionary: Dictionary<HTTPCookiePropertyKey, Any> = [
            HTTPCookiePropertyKey.name    : "SMSESSION",
            HTTPCookiePropertyKey.value   : "1",
            HTTPCookiePropertyKey.domain  : "verizon.com",
            HTTPCookiePropertyKey.path    : "/",
            HTTPCookiePropertyKey.secure  : true
        ]
        let persistentDictionary: Dictionary<HTTPCookiePropertyKey, Any> = [
            HTTPCookiePropertyKey.name                 : "__invasive_marketing_spy",
            HTTPCookiePropertyKey.value                : "the-number-of-the-beast",
            HTTPCookiePropertyKey.domain               : "yoyodyne.com",
            HTTPCookiePropertyKey.path                 : "/",
            HTTPCookiePropertyKey.secure               : false,
            HTTPCookiePropertyKey.expires              : Date.distantFuture,
            HTTPCookiePropertyKey(rawValue: "HttpOnly"): true
        ]
        let smsessionHTTPCookie = HTTPCookie(properties: smsessionDictionary)
        let persistentHTTPCookie = HTTPCookie(properties: persistentDictionary)
        let mockCookies: Array<HTTPCookie> = [
            smsessionHTTPCookie!,
            persistentHTTPCookie!
        ]
        return mockCookies
    }
    
    public func fixtures() -> [HTTPCookie] {
        var cookieFixture: [HTTPCookie] = []
        let cookieStrings: String = cookieFixturesFromFile()
        if let dataFromString = cookieStrings.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            print("\n\n\nfixtures() --> json: \(json)\n\n\n")
            //cookieFixture = json.arrayObject! as! [HTTPCookie]
            //json.arrayObject!.map { _ in cookieFixture.append(_ as! HTTPCookie) }
        }
        return cookieFixture
    }
    
    private func cookieFixturesFromFile() -> String {
        var cookieFixture: String
        cookieFixture = try! String(contentsOfFile: self.fixtureFilePath, encoding: .utf8)
        
        return cookieFixture
    }
    
}
