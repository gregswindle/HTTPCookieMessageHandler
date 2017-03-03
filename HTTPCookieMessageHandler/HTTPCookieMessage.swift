//
//  HTTPCookieMessage.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 3/2/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation

public struct HTTPCookieMessage: Message {
  
  public typealias ItemType = HTTPCookie
  
  public var topic: String
  
  public var headers: [String:String]
  
  public var body: [ItemType]
  
  init(_ topic: String, _ headers: [String:String]? = [String:String](), _ body: [ItemType]? = [ItemType]()) {
    self.topic = topic
    self.headers = (headers)!
    self.body = (body)!
  }
}
