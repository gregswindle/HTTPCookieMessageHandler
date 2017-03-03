//
//  HTTPCookieJsonTests.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/26/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation
import Quick
import Nimble
import HTTPCookieMessageHandler

class HTTPCookieJsonSpec: QuickSpec {
  override func spec() {

    describe("HTTPCookieJson serializes and deserializes HTTPCookies to from JSON") {

      var cookie: HTTPCookie!
      var cookieProperties: Dictionary<HTTPCookiePropertyKey, Any>!

      beforeEach {
        cookieProperties = [HTTPCookiePropertyKey: Any]()
        cookieProperties[HTTPCookiePropertyKey.name] = "SMSESSION"
        cookieProperties[HTTPCookiePropertyKey.value] = "PUsECFYS-etc-etc-etc"
        cookieProperties[HTTPCookiePropertyKey.path] = "/"
        cookieProperties[HTTPCookiePropertyKey.domain] = ".verizon.com"
        cookieProperties[HTTPCookiePropertyKey.expires] = HTTPCookieJson.date(httpDate:"Thu, 09 Mar 2017 23:39:40 GMT")

        cookie = HTTPCookie(properties: cookieProperties)
      }

      it("serializes an HTTPCookie to a JSON string") {
        let json = HTTPCookieJson.rawString(cookie: cookie)
        expect(json).to(beAnInstanceOf(String.self))
        expect(json).to(contain("Expires"))
        expect(json).to(contain("SMSESSION"))
        expect(json).to(contain("\"Expires\" : \"Thu, 29 Dec 2016 23:39:40 GMT\""))
      }

      it("serializes an HTTPCookie to a JSON Dictionary") {
        let json: Dictionary<String, Any> = HTTPCookieJson.dictionary(cookie: cookie)
        expect(json).to(beAnInstanceOf(Dictionary<String, Any>.self))
        expect(json.keys).to(haveCount(6))
        expect(json.values).to(haveCount(6))
        let cookieName: String = String(describing: json["Name"])
        expect(cookieName).to(contain("SMSESSION"))
      }

      it("serializes a dictionary to an HTTPCookie") {
        let smsessionCookie = HTTPCookieJson.cookie(dictionary: cookieProperties)
        expect(smsessionCookie.name).to(contain("SMSESSION"))
        expect(smsessionCookie.path).to(contain("/"))
      }

    }

  }
}
