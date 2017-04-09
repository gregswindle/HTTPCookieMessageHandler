# `HTTPCookieMessageHandler`

> Send and receive `HTTPCookies` formatted as `JSON` over `HTTP(S)`.

[![CI Status](http://img.shields.io/travis/gregswindle/HTTPCookieMessageHandler.svg?style=flat)](https://travis-ci.org/gregswindle/HTTPCookieMessageHandler?branch=develop)
[![Coverage Status](https://coveralls.io/repos/github/gregswindle/HTTPCookieMessageHandler/badge.svg?branch=feat%2F%231%2Fautomate-coverage-coveralls)](https://coveralls.io/github/gregswindle/HTTPCookieMessageHandler?branch=feat%2F%231%2Fautomate-coverage-coveralls)
[![Version](https://img.shields.io/cocoapods/v/HTTPCookieMessageHandler.svg?style=flat)](http://cocoapods.org/pods/HTTPCookieMessageHandler)
[![License](https://img.shields.io/cocoapods/l/HTTPCookieMessageHandler.svg?style=flat)](http://cocoapods.org/pods/HTTPCookieMessageHandler)
[![Platform](https://img.shields.io/cocoapods/p/HTTPCookieMessageHandler.svg?style=flat)](http://cocoapods.org/pods/HTTPCookieMessageHandler)

## 1. Usage

Use `HTTPCookieMessageHandler` to receive and send `HTTPCookies` formatted as `JSON` over HTTP(S).

`HTTPCookieMessageHandler`:

* Serializes `HTTPCookies` as `JSON` strings so you can `POST` or `PUT` them.

* Deserializes `HTTPCookies` as `Dictionary<HTTPCookiePropertyKey, Any>` objects so you can use them in your code.

* Saves `HTTPCookies` in `HTTPCookieStorage`.

* Fetches `HTTPCookies` from `HTTPCookieStorage`.

> ### :soon: Observe `HTTPCookies`
>
> Use [`ReactiveX / RxSwift`](https://github.com/ReactiveX/RxSwift) to watch for cookies changing value and notify interested parties when they do (e.g., signaling when a session cookie has changed or expired).

### 1.1. `HTTPCookie` serialization

For the following examples, let's assume we have a cookie called `sessionCookie`.

### 1.2. `HTTPCookie` to `Dictionary<HTTPCookiePropertyKey, Any>`

```swift
let cookieDictionary: Dictionary<HTTPCookiePropertyKey, Any>
  = HTTPCookieJson.dictionary(cookie: sessionCookie)
```
### 1.3. `HTTPCookie` to `String`

```swift
let jsonString: String =
  HTTPCookieJson.rawString(cookie: sessionCookie)
```

### 1.4. `Dictionary<HTTPCookiePropertyKey, Any>` to `HTTPCookie`

```swift
// Assume that a Dictionary for a Session Cookie
// called "sessionDictionary" exists

let cookie: HTTPCookie =
  HTTPCookieJson.cookie(dictionary: sessionDictionary)
```
### 1.5. `CRUD` using the `MessageHandler` `Protocol` (aka "`Interface`")

The [`MessageHandler`](HTTPCookieMessageHandler/MessageHandler.swift) protocol defines a common interface for creating, reading, updating, and deleting data.

## 2. Requirements

This library was written in Swift version 3.0.1.

## 3. Installation

> ### :information_source: CocoaPods
>
> You need CocoaPods to install `HTTPCookieMessageHandler`. Read [Getting Started](https://guides.cocoapods.org/using/getting-started.html#getting-started) on the CocoaPods site, if you don't have `cocoapods` installed, already.

### 3.1. Clone the `HTTPCookieMessageHandler` repository

`HTTPCookieMessageHandler` is not (yet) available through [CocoaPods](http://cocoapods.org). :disappointed: To install
it, add the following line to your `Podfile`:

```ruby
pod 'HTTPCookieMessageHandler', :git => 'https://github.com/gregswindle/HTTPCookieMessageHandler.git'
```

### 3.2. Install `HTTPCookieMessageHandler`

Save your `Podfile` and run

```
$ pod install
```

### 3.3. Xcode

If your Xcode project is open, close it and **reopen the `*.xcworkspace`, _not_ the ``*.xcodeproj`**.

## 4. Testing

`HTTPCookieMessageHandler` uses

* [Quick](https://github.com/Quick/Quick) for BDD tests

* [Nimble](https://github.com/Quick/Nimble) for matchers

* [Slather](https://github.com/SlatherOrg/slather) for detailed code coverage reports.

* ~~[Cuckoo](https://github.com/SwiftKit/Cuckoo) for mocks and stubs~~

> ### :ghost: Mocks
>
Swift doesn't handle spys, stubs, and mocks well. Four libraries later, I ended up building my own, based on suggestions in the article [Real World Mocking in Swift](https://realm.io/news/tryswift-veronica-ray-real-world-mocking-swift/). Check out the simple [`called` Dictionary](HTTPCookieMessageHandlerTests/HTTPCookieMessageHandlerTests.swift#L66) for details.

## 5. Cookies

> :information_source: This section covers some important points about cookies. I mainly wrote it to guide unit testing.

### 5.1. Cookie attributes and case-sensitivity

Despite the debates you'll find online, `HTTPCookieMessageHandler` treats cookie attribute names with case-sensitivity. For Verizon's use cases, it doesn't really matter, though: `HTTPCookieMessageHandler` is not intended to create or edit cookies; it's supposed to simply "handle" cookies as "messages".

### 5.2. Cookie syntax and formatting

#### 5.2.1. [Set-Cookie Syntax](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie)

###### 5.2.1.2. Name=Value

> :cookie: _(Required)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`

###### 5.2.1.3. Expires

> :cookie: _(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; Expires=`<date>`

Cookie dates follow the [RFC 7231, section 7.1.1.2: Date](RFC 7231, section 7.1.1.2: Date) format.

[Date syntax and directives](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date)
 `<day-name>`, `<day>` `<month>` `<year>` `<hour>`:`<minute>`:`<second>` `GMT`

> `<day-name>` One of "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", or "Sun" (case-sensitive).

> `<day>` 2 digit day number, e.g. "04" or "23".

> `<month>` One of "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" (case sensitive).

> `<year>` 4 digit year number, e.g. "1990" or "2016".

> `<hour>` 2 digit hour number, e.g. "09" or "23".

> `<minute>` 2 digit minute number, e.g. "04" or "59".

> `<second>` 2 digit second number, e.g. "04" or "59".

> `GMT` Greenwich Mean Time. HTTP dates are always expressed in GMT, never in local time.

###### 5.2.1.4. Max-Age

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; Max-Age=`<non-zero-digit>`

###### 5.2.1.5. Domain

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; Domain=`<domain-value>`

###### 5.2.1.6. Path

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; Path=`<path-value>`

###### 5.2.1.7. Secure

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; Secure

###### 5.2.1.8. HTTP only

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; HttpOnly

###### 5.2.1.9. SameSite=Strict

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; SameSite=Strict

###### 5.2.1.10. SameSite=Lax

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; SameSite=Lax

Multiple directives are also possible, for example:

> :cookie: _(Optional)_
> Set-Cookie: `<cookie-name>`=`<cookie-value>`; Domain=`<domain-value>`; Secure; HttpOnly

#### 5.3. Set-Cookie Examples

```
Set-Cookie: user_session=PUsECFYS; path=/; expires=Thu, 09 Mar 2017 23:39:40 -0000; secure; HttpOnly

Set-Cookie: __Host-user_session_same_site=PUsECFYS; path=/; expires=Thu, 09 Mar 2017 23:39:40 -0000; secure; HttpOnly; SameSite=Strict

Set-Cookie: _gh_sess=be0f5eb4; path=/; Secure; HttpOnly

Set-Cookie: SMCHALLENGE=NTC_CHALLENGE_DONE; Path=/; domain=.verizon.com

Set-Cookie: SMCHALLENGE=NTC_CHALLENGE_DONE; Path=/; domain=.verizon.com

Set-Cookie: SMCHALLENGE=; Expires=Sat, 27 Aug 2016 23:46:21 GMT; Path=/; Domain=.verizon.com
```

## 6. Author

[Greg Swindle](mailto:greg@swindle.net)

## 7. License

`HTTPCookieMessageHandler` is available under the Apache 2.0 license. See the [LICENSE](LICENSE) file for more info.
