//
//  MockHTTPCookieStorage.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/28/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation
import Mockit
import Quick

public class MockHTTPCookieStorage: HTTPCookieStorage, Mock {
  
  // adopted from protocol Mock
  public let callHandler: CallHandler

  // adopted from protocol Mock
  public typealias InstanceType = HTTPCookieStorage
  
  // adopted from protocol Mock
  public func instanceType() -> HTTPCookieStorage {
    return self
  }
  
  // adopted from protocol Mock
  init(testCase: QuickSpec) {
    callHandler = CallHandlerImpl(withTestCase: testCase)
  }

  
  public var factory = MockHTTPCookieFactory()
  public var smsessionHTTPCookieFixturePath = "Fixtures/SMSESSIONCookie.json"
  public var httpCookiesFixturePath = "Fixtures/Cookies.json"
  
  
  override public var cookies: [HTTPCookie]? {
    get {
      //self.callToMethod["cookies"] = true
      return self.factory.makeHTTPCookieMocks()
    }
  }
  
  override public func cookies(for URL: URL) -> [HTTPCookie]? {
    //self.callToMethod["cookies:for"] = true
    return self.factory.makeHTTPCookieMocks()
  }
  
  override public func setCookie(_ cookie: HTTPCookie) {
    //self.callToMethod["setCookie"] = true
    callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs: cookie)
  }
  
  override public func setCookies(_ cookies: [HTTPCookie], for URL: URL?, mainDocumentURL: URL?) {
    //self.callToMethod["setCookies:for"] = true
    callHandler.accept("", ofFunction: #function, atFile: #file, inLine: #line, withArgs: cookies)
  }
  
//  override public class var shared: HTTPCookieStorage {
//    get {
//      //callToMethod["shared"] = true
//      return MockHTTPCookieStorage(testCase: QuickSpec)
//    }
//  }
  
}
