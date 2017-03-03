//
//  Cookie2Json.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/26/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation
import SwiftyJSON

public class HTTPCookieJson {

  public static func dictionary(cookie: HTTPCookie) -> Dictionary<String, Any> {
    var cookieDictionary = Dictionary<String, Any>()
    cookieDictionary[HTTPCookiePropertyKey.name.rawValue] = cookie.name
    cookieDictionary[HTTPCookiePropertyKey.value.rawValue] = cookie.value
    cookieDictionary[HTTPCookiePropertyKey.comment.rawValue] = cookie.comment
    cookieDictionary[HTTPCookiePropertyKey.commentURL.rawValue] = cookie.commentURL
    cookieDictionary[HTTPCookiePropertyKey.expires.rawValue] = httpDateFormat(fromDate: cookie.expiresDate!)
    cookieDictionary[HTTPCookiePropertyKey.path.rawValue] = cookie.path
    cookieDictionary[HTTPCookiePropertyKey.secure.rawValue] = cookie.isSecure
    cookieDictionary[HTTPCookiePropertyKey.version.rawValue] = cookie.version

    return cookieDictionary
  }

  public static func rawString(cookie: HTTPCookie) -> String {
    return JSON(dictionary(cookie: cookie)).rawString()!;
  }

  public static func cookie(dictionary: Dictionary<HTTPCookiePropertyKey, Any>!) -> HTTPCookie {
    var cookieDictionary = Dictionary<HTTPCookiePropertyKey, Any>()
    for key in dictionary.keys {
      cookieDictionary[key] = dictionary[key].unsafelyUnwrapped
    }
    return HTTPCookie(properties: cookieDictionary)!
  }

  /// Converts Date instances to "HTTP-Date" as described in RFC 7231, section 7.1.1.2: Date
  /// Example output: Thu, 09 Mar 2017 03:39:40 GMT
  /// @see https://waracle.net/iphone-nsdateformatter-date-formatting-table/
  public static func httpDateFormat(fromDate: Date) -> String {
    let rfc7231Date = httpDateFormatter.string(from: fromDate)
    return rfc7231Date
  }

  public static func date(httpDate: String) -> Date {
    let date = httpDateFormatter.date(from: httpDate)
    return date!
  }

  private static var httpDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "EE, dd MMM YYYY HH:mm:ss z"
    formatter.timeZone = TimeZone(abbreviation: "GMT")
    return formatter
  }
}
