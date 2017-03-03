// MARK: - Mocks generated from file: HTTPCookieMessageHandler/HTTPCookieJson.swift at 2017-03-03 01:01:47 +0000

//
//  Cookie2Json.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/26/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Cuckoo
@testable import HTTPCookieMessageHandler

import Foundation
import SwiftyJSON

public class MockHTTPCookieJson: HTTPCookieJson, Cuckoo.Mock {
    public typealias MocksType = HTTPCookieJson
    public typealias Stubbing = __StubbingProxy_HTTPCookieJson
    public typealias Verification = __VerificationProxy_HTTPCookieJson
    public let manager = Cuckoo.MockManager()
    
    private var observed: HTTPCookieJson?
    
    public func spy(on victim: HTTPCookieJson) -> Self {
        observed = victim
        return self
    }
    
    public struct __StubbingProxy_HTTPCookieJson: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
    }
    
    public struct __VerificationProxy_HTTPCookieJson: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    }
}

public class HTTPCookieJsonStub: HTTPCookieJson {
}

// MARK: - Mocks generated from file: HTTPCookieMessageHandler/MessageHandler.swift at 2017-03-03 01:01:47 +0000

//
//  MessageHandler.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/28/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Cuckoo
@testable import HTTPCookieMessageHandler

import Foundation

public class MockMessageHandler: MessageHandler, Cuckoo.Mock {
    public typealias MocksType = MessageHandler
    public typealias Stubbing = __StubbingProxy_MessageHandler
    public typealias Verification = __VerificationProxy_MessageHandler
    public let manager = Cuckoo.MockManager()
    
    private var observed: MessageHandler?
    
    public func spy(on victim: MessageHandler) -> Self {
        observed = victim
        return self
    }
    
    public func find(_ options: Dictionary<String, Any>?, _ callbackPredicate: (ItemType) -> Bool) -> ItemType? {
        return manager.call("find(_: Dictionary<String, Any>?, _: (ItemType) -> Bool) -> ItemType?", parameters: (options, callbackPredicate), original: observed.map { o in return { (options: Dictionary<String, Any>?, callbackPredicate: (ItemType) -> Bool) -> ItemType? in o.find(options, callbackPredicate) } })
    }
    
    public func save(item: ItemType) {
        return manager.call("save(item: ItemType)", parameters: (item), original: observed.map { o in return { (item: ItemType) in o.save(item: item) } })
    }
    
    public func save(_ options: Dictionary<String, Any>?, items: [ItemType]) {
        return manager.call("save(_: Dictionary<String, Any>?, items: [ItemType])", parameters: (options, items), original: observed.map { o in return { (options: Dictionary<String, Any>?, items: [ItemType]) in o.save(options, items: items) } })
    }
    
    public struct __StubbingProxy_MessageHandler: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        public func find<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, _ callbackPredicate: M2) -> Cuckoo.StubFunction<(Dictionary<String, Any>?, (ItemType) -> Bool), ItemType?> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == (ItemType) -> Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, (ItemType) -> Bool)>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: callbackPredicate) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("find(_: Dictionary<String, Any>?, _: (ItemType) -> Bool) -> ItemType?", parameterMatchers: matchers))
        }
        
        public func save<M1: Cuckoo.Matchable>(item: M1) -> Cuckoo.StubNoReturnFunction<(ItemType)> where M1.MatchedType == ItemType {
            let matchers: [Cuckoo.ParameterMatcher<(ItemType)>] = [wrap(matchable: item) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("save(item: ItemType)", parameterMatchers: matchers))
        }
        
        public func save<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, items: M2) -> Cuckoo.StubNoReturnFunction<(Dictionary<String, Any>?, [ItemType])> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == [ItemType] {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, [ItemType])>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: items) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("save(_: Dictionary<String, Any>?, items: [ItemType])", parameterMatchers: matchers))
        }
    }
    
    public struct __VerificationProxy_MessageHandler: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        public func find<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, _ callbackPredicate: M2) -> Cuckoo.__DoNotUse<ItemType?> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == (ItemType) -> Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, (ItemType) -> Bool)>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: callbackPredicate) { $0.1 }]
            return manager.verify("find(_: Dictionary<String, Any>?, _: (ItemType) -> Bool) -> ItemType?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func save<M1: Cuckoo.Matchable>(item: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ItemType {
            let matchers: [Cuckoo.ParameterMatcher<(ItemType)>] = [wrap(matchable: item) { $0 }]
            return manager.verify("save(item: ItemType)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func save<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, items: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == [ItemType] {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, [ItemType])>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: items) { $0.1 }]
            return manager.verify("save(_: Dictionary<String, Any>?, items: [ItemType])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

public class MessageHandlerStub: MessageHandler {
    
    public func find(_ options: Dictionary<String, Any>?, _ callbackPredicate: (ItemType) -> Bool) -> ItemType? {
        return DefaultValueRegistry.defaultValue(for: (ItemType?).self)
    }
    
    public func save(item: ItemType) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func save(_ options: Dictionary<String, Any>?, items: [ItemType]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

// MARK: - Mocks generated from file: HTTPCookieMessageHandler/HTTPCookieMessageHandler.swift at 2017-03-03 01:01:47 +0000

//
//  HTTPCookieMessageHandler.swift
//  HTTPCookieMessageHandler
//
//  Created by Swindle, Gregory Jay (Greg) on 2/26/17.
//  Copyright © 2017 Swindle, Gregory Jay (Greg). All rights reserved.
//

import Cuckoo
@testable import HTTPCookieMessageHandler

import Foundation

public class MockHTTPCookieMessageHandler: HTTPCookieMessageHandler, Cuckoo.Mock {
    public typealias MocksType = HTTPCookieMessageHandler
    public typealias Stubbing = __StubbingProxy_HTTPCookieMessageHandler
    public typealias Verification = __VerificationProxy_HTTPCookieMessageHandler
    public let manager = Cuckoo.MockManager()
    
    private var observed: HTTPCookieMessageHandler?
    
    public func spy(on victim: HTTPCookieMessageHandler) -> Self {
        observed = victim
        return self
    }
    
    public override var message: HTTPCookieMessage {
        get {
            return manager.getter("message", original: observed.map { o in return { () -> HTTPCookieMessage in o.message } })
        }
        set {
            manager.setter("message", value: newValue, original: observed != nil ? { self.observed?.message = $0 } : nil)
        }
    }
    
    public override var dataStore: HTTPCookieStorage! {
        get {
            return manager.getter("dataStore", original: observed.map { o in return { () -> HTTPCookieStorage! in o.dataStore } })
        }
        set {
            manager.setter("dataStore", value: newValue, original: observed != nil ? { self.observed?.dataStore = $0 } : nil)
        }
    }
    
    public override func find(_ options: Dictionary<String, Any>?, _ callbackPredicate: (ItemType) -> Bool) -> ItemType? {
        return manager.call("find(_: Dictionary<String, Any>?, _: (ItemType) -> Bool) -> ItemType?", parameters: (options, callbackPredicate), original: observed.map { o in return { (options: Dictionary<String, Any>?, callbackPredicate: (ItemType) -> Bool) -> ItemType? in o.find(options, callbackPredicate) } })
    }
    
    public override func save(item: ItemType) {
        return manager.call("save(item: ItemType)", parameters: (item), original: observed.map { o in return { (item: ItemType) in o.save(item: item) } })
    }
    
    public override func save(_ options: Dictionary<String, Any>?, items: [ItemType]) {
        return manager.call("save(_: Dictionary<String, Any>?, items: [ItemType])", parameters: (options, items), original: observed.map { o in return { (options: Dictionary<String, Any>?, items: [ItemType]) in o.save(options, items: items) } })
    }
    
    public override func makeURL(_ options: Dictionary<String, Any>?) -> URL? {
        return manager.call("makeURL(_: Dictionary<String, Any>?) -> URL?", parameters: (options), original: observed.map { o in return { (options: Dictionary<String, Any>?) -> URL? in o.makeURL(options) } })
    }
    
    public struct __StubbingProxy_HTTPCookieMessageHandler: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        public init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var message: Cuckoo.ToBeStubbedProperty<HTTPCookieMessage> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "message")
        }
        
        var dataStore: Cuckoo.ToBeStubbedProperty<HTTPCookieStorage?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "dataStore")
        }
        
        public func find<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, _ callbackPredicate: M2) -> Cuckoo.StubFunction<(Dictionary<String, Any>?, (ItemType) -> Bool), ItemType?> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == (ItemType) -> Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, (ItemType) -> Bool)>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: callbackPredicate) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("find(_: Dictionary<String, Any>?, _: (ItemType) -> Bool) -> ItemType?", parameterMatchers: matchers))
        }
        
        public func save<M1: Cuckoo.Matchable>(item: M1) -> Cuckoo.StubNoReturnFunction<(ItemType)> where M1.MatchedType == ItemType {
            let matchers: [Cuckoo.ParameterMatcher<(ItemType)>] = [wrap(matchable: item) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("save(item: ItemType)", parameterMatchers: matchers))
        }
        
        public func save<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, items: M2) -> Cuckoo.StubNoReturnFunction<(Dictionary<String, Any>?, [ItemType])> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == [ItemType] {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, [ItemType])>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: items) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("save(_: Dictionary<String, Any>?, items: [ItemType])", parameterMatchers: matchers))
        }
        
        func makeURL<M1: Cuckoo.Matchable>(_ options: M1) -> Cuckoo.StubFunction<(Dictionary<String, Any>?), URL?> where M1.MatchedType == Dictionary<String, Any>? {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?)>] = [wrap(matchable: options) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("makeURL(_: Dictionary<String, Any>?) -> URL?", parameterMatchers: matchers))
        }
    }
    
    public struct __VerificationProxy_HTTPCookieMessageHandler: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var message: Cuckoo.VerifyProperty<HTTPCookieMessage> {
            return Cuckoo.VerifyProperty(manager: manager, name: "message", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var dataStore: Cuckoo.VerifyProperty<HTTPCookieStorage?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "dataStore", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func find<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, _ callbackPredicate: M2) -> Cuckoo.__DoNotUse<ItemType?> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == (ItemType) -> Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, (ItemType) -> Bool)>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: callbackPredicate) { $0.1 }]
            return manager.verify("find(_: Dictionary<String, Any>?, _: (ItemType) -> Bool) -> ItemType?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func save<M1: Cuckoo.Matchable>(item: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ItemType {
            let matchers: [Cuckoo.ParameterMatcher<(ItemType)>] = [wrap(matchable: item) { $0 }]
            return manager.verify("save(item: ItemType)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        public func save<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ options: M1, items: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Dictionary<String, Any>?, M2.MatchedType == [ItemType] {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?, [ItemType])>] = [wrap(matchable: options) { $0.0 }, wrap(matchable: items) { $0.1 }]
            return manager.verify("save(_: Dictionary<String, Any>?, items: [ItemType])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func makeURL<M1: Cuckoo.Matchable>(_ options: M1) -> Cuckoo.__DoNotUse<URL?> where M1.MatchedType == Dictionary<String, Any>? {
            let matchers: [Cuckoo.ParameterMatcher<(Dictionary<String, Any>?)>] = [wrap(matchable: options) { $0 }]
            return manager.verify("makeURL(_: Dictionary<String, Any>?) -> URL?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

public class HTTPCookieMessageHandlerStub: HTTPCookieMessageHandler {
    
    public override var message: HTTPCookieMessage {
        get {
            return DefaultValueRegistry.defaultValue(for: (HTTPCookieMessage).self)
        }
        set {
        }
    }
    
    public override var dataStore: HTTPCookieStorage! {
        get {
            return DefaultValueRegistry.defaultValue(for: (HTTPCookieStorage!).self)
        }
        set {
        }
    }
    
    public override func find(_ options: Dictionary<String, Any>?, _ callbackPredicate: (ItemType) -> Bool) -> ItemType? {
        return DefaultValueRegistry.defaultValue(for: (ItemType?).self)
    }
    
    public override func save(item: ItemType) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public override func save(_ options: Dictionary<String, Any>?, items: [ItemType]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public override func makeURL(_ options: Dictionary<String, Any>?) -> URL? {
        return DefaultValueRegistry.defaultValue(for: (URL?).self)
    }
}
