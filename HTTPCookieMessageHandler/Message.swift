//
//  Message.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 3/2/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Foundation

public protocol Message {

    associatedtype ItemType

    var topic: String { get set }

    var headers: [String:String] { get set }

    var body: [ItemType] { get set }
}
