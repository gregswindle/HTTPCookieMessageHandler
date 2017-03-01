//
//  MessageHandler.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/28/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation

public protocol MessageHandler {
  
  associatedtype ItemType
  
  associatedtype StorageItemType
  
  mutating func find(_ options: Dictionary<String, Any>?, _ callbackPredicate: (ItemType) -> Bool) -> ItemType?
  
  func save(item: ItemType)
  
  func save(_ options: Dictionary<String, Any>?, items: [ItemType])
  
}
