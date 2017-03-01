# `HTTPCookieMessageHandler`

[![CI Status](http://img.shields.io/travis/gregswindle/HTTPCookieMessageHandler.svg?style=flat)](https://travis-ci.org/gregswindle/HTTPCookieMessageHandler)
[![Version](https://img.shields.io/cocoapods/v/HTTPCookieMessageHandler.svg?style=flat)](http://cocoapods.org/pods/HTTPCookieMessageHandler)
[![License](https://img.shields.io/cocoapods/l/HTTPCookieMessageHandler.svg?style=flat)](http://cocoapods.org/pods/HTTPCookieMessageHandler)
[![Platform](https://img.shields.io/cocoapods/p/HTTPCookieMessageHandler.svg?style=flat)](http://cocoapods.org/pods/HTTPCookieMessageHandler)

## Usage

Use `HTTPCookieMessageHandler` to receive and send `HTTPCookies` formatted as `JSON` over HTTP(S).

`HTTPCookieMessageHandler`:

1. Serializes `HTTPCookies` as `JSON` strings so you can `POST` or `PUT` them.

2. Deserializes `HTTPCookies` as `Dictionary<HTTPCookiePropertyKey, Any>` objects so you can use them in your code.

3. Saves `HTTPCookies` in `HTTPCookieStorage`.

4. Fetches `HTTPCookies` from `HTTPCookieStorage`.

5. **DRAFT**: Observes `HTTPCookies` of interest and and notifies whenever they change, e.g., signaling when a session cookie has changed or expired.

## `HTTPCookie` serialization

For the following examples, let's assume we have a cookie called `sessionCookie`.

### `HTTPCookie` to `Dictionary<HTTPCookiePropertyKey, Any>`

```swift
let cookieDictionary: Dictionary<HTTPCookiePropertyKey, Any>
  = HTTPCookieJson.dictionary(cookie: sessionCookie)
```
### `HTTPCookie` to `String`

```swift
let jsonString: String =
  HTTPCookieJson.rawString(cookie: sessionCookie)
```

### `Dictionary<HTTPCookiePropertyKey, Any>` to `HTTPCookie`

```swift
// Assume that a Dictionary for a Session Cookie
// called "sessionDictionary" exists

let cookie: HTTPCookie =
  HTTPCookieJson.cookie(dictionary: sessionDictionary)
```
## `CRUD` using the `MessageHandler` `Protocol` (aka "`Interface`")

The [`MessageHandler`](HTTPCookieMessageHandler/MessageHandler.swift) protocol defines a common interface for creating, reading, updating, and deleting data.

## Requirements

This library was written in Swift version 3.0. It hasn't been tested for `Objective C` bridging, yet: that's next.

## Installation

`HTTPCookieMessageHandler` is not (yet) available through [CocoaPods](http://cocoapods.org). To install
it, you'll need an SSH account on Verizon OneStash. If you do, simply add the following line to your Podfile:

```ruby
pod 'HTTPCookieMessageHandler', :git => 'ssh://git@onestash.verizon.com:7999/~v128477/httpcookiemessagehandler.git'
```

Save your `Podfile` and run

```
$ pod install
```

## Testing

`HTTPCookieMessageHandler` uses
* [Quick](https://github.com/Quick/Quick) for BDD tests

* [Nimble](https://github.com/Quick/Nimble) for matchers

* [Slather](https://github.com/SlatherOrg/slather) for detailed code coverage reports.

> **Mocks?** Swift doesn't handle stubs and mocks well, and the libraries I've tried so far have been more trouble then they're worth. I'm currently rolling my own mocks, as suggested in [Real World Mocking in Swift](https://realm.io/news/tryswift-veronica-ray-real-world-mocking-swift/). I'm working on it.... :sweat:

## Additional notes

This section covers some important points about cookies. I mainly wrote it to guide unit testing.

### Cookie attributes and case-sensitivity

Despite the debates you'll find online, `HTTPCookieMessageHandler` treats cookie attribute names with case-sensitivity. For Verizon's use cases, it doesn't really matter, though: `HTTPCookieMessageHandler` is not intended to create or edit cookies; it's supposed to simply "handle" cookies as "messages".

### Cookie syntax and formatting

#### 1. [Set-Cookie Syntax](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie)

###### 1.1. Name=Value

_(Required)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`

###### 1.2. Expires

_(Optional)_
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

###### 1.3. Max-Age

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; Max-Age=`<non-zero-digit>`

###### 1.4. Domain

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; Domain=`<domain-value>`

###### 1.5. Path

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; Path=`<path-value>`

###### 1.6. Secure

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; Secure

###### 1.7. HTTP only

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; HttpOnly

###### 1.8. SameSite=Strict

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; SameSite=Strict

###### 1.9. SameSite=Lax

_(Optional)_
Set-Cookie: `<cookie-name>`=`<cookie-value>`; SameSite=Lax

Multiple directives are also possible, for example:

Set-Cookie: `<cookie-name>`=`<cookie-value>`; Domain=`<domain-value>`; Secure; HttpOnly

#### 2. Set-Cookie Examples

```
Set-Cookie: user_session=PUsECFYS; path=/; expires=Thu, 09 Mar 2017 23:39:40 -0000; secure; HttpOnly

Set-Cookie: __Host-user_session_same_site=PUsECFYS; path=/; expires=Thu, 09 Mar 2017 23:39:40 -0000; secure; HttpOnly; SameSite=Strict

Set-Cookie: _gh_sess=be0f5eb4; path=/; Secure; HttpOnly

Set-Cookie: SMCHALLENGE=NTC_CHALLENGE_DONE; Path=/; domain=.verizon.com

Set-Cookie: SMCHALLENGE=NTC_CHALLENGE_DONE; Path=/; domain=.verizon.com

Set-Cookie: SMCHALLENGE=; Expires=Sat, 27 Aug 2016 23:46:21 GMT; Path=/; Domain=.verizon.com
```

## Author

Greg Swindle, gregory.jay.swindle@one.verizon.com

## License

HTTPCookieMessageHandler is available under the MIT license. See the LICENSE file for more info.
