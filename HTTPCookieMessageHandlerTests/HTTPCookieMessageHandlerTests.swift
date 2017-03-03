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
      var mockDataStore = MockHTTPCookieStorage()
      var cookie: HTTPCookie!
      var cookieHandler: HTTPCookieMessageHandler!
      var factory: MockHTTPCookieFactory!
      var cookies: [HTTPCookie]!

      beforeSuite {
        factory = MockHTTPCookieFactory()
        cookies = factory.makeHTTPCookieMocks()
      }
      
      beforeEach {
        mockDataStore = MockHTTPCookieStorage()
        cookieHandler = HTTPCookieMessageHandler(dataStore: mockDataStore)
      }
      
      it("will use the HTTPCookieStorage.shared cookie jar by default") {
        cookieHandler = HTTPCookieMessageHandler()
        expect(cookieHandler.dataStore).notTo(equal(mockDataStore))
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
        cookieHandler.dataStore = mockDataStore
        cookieHandler.save(item: cookie)
        expect(mockDataStore.called["setCookie"]).to(beTrue())
      }

      it("can save multiple cookies") {
        cookieHandler.save(["forUrl": "https://verizon.com"], items: cookies);
        expect(mockDataStore.called["setCookie:for"]).to(beTrue())
      }
    }
  }
}
