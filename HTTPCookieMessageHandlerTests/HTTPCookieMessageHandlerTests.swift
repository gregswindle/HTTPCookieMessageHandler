//
//  HTTPCookieMessageHandlerTests.swift
//  HTTPCookieMessageHandlerTests
//
//  Created by Swindle, Gregory Jay (Greg) on 2/26/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Quick
import Nimble
import HTTPCookieMessageHandler

class HTTPCookieMessageHandlerSpec : QuickSpec {

    override func spec() {
    
    describe("HTTPCookieMessageHandler") {

      let SMSESSION: Int = 0
      var cookie: HTTPCookie!
      var cookieHandler: HTTPCookieMessageHandler!
      var shared: HTTPCookieStorage!
      var factory: MockHTTPCookieFactory!
      var cookies: [HTTPCookie]!

      beforeSuite {
        factory = MockHTTPCookieFactory()
        cookieHandler = HTTPCookieMessageHandler()
        shared = MockHTTPCookieStorage(testCase: self)
        cookieHandler.dataStore = shared
        cookies = factory.makeHTTPCookieMocks()
      }

      it("can search for cookies in the cookie store with a truth-predicate callback but without options") {
        cookie = cookieHandler.find { $0.name == "ANOTHER_UNDEFINED_COOKIE" }
        expect(cookie).to(beNil())

        cookie = cookieHandler.find { $0.name == "SMSESSION" }
        expect(cookie).notTo(beNil())
        expect(cookie.domain).to(contain("verizon.com"))
      }

      it("can search for cookies in the cookie store using a Dictionary<String, Any> for options and a callback predicate") {
        let options: Dictionary<String, Any> = [
          "forUrl": "https://verizon.com"
        ]
        cookie = cookieHandler.find(options) { $0.name == "UNDEFINED_COOKIE" }
        expect(cookie).to(beNil())

        cookie = cookieHandler.find(options) { $0.name == "SMSESSION" }
        expect(cookie).notTo(beNil())
        expect(cookie.domain).to(contain("verizon.com"))
      }

      it("can save a single cookie") {
        cookie = cookies[SMSESSION]
        cookieHandler.save(item: cookie)
        // This is NOT the way to unit test! It'll have to suffice while I figure out mocks in Swift...
        expect(cookieHandler.dataStore.cookies!.count).to(beGreaterThanOrEqualTo(1))
        cookieHandler.dataStore.deleteCookie(cookie)
      }

      it("can save multiple cookies") {
        cookieHandler.save(["forUrl": "https://verizon.com"], items: cookies);
        // This is NOT the way to unit test! It'll have to suffice while I figure out mocks in Swift...
        expect(cookieHandler.dataStore.cookies!.count).to(beGreaterThanOrEqualTo(1))
        cookieHandler.dataStore.removeCookies(since: Date.distantPast)
      }
    }
  }
}
