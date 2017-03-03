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

  //associatedtype StorageItemType

  func find(_ options: [String: Any]?, _ callbackPredicate: (ItemType) -> Bool) -> ItemType?

  func save(item: ItemType)

  func save(_ options: [String: Any]?, items: [ItemType])

}
