# Taptic Engine Cordova plugin
by [Eddy Verbruggen](http://twitter.com/eddyverbruggen)

> __BEWARE__ This plugin uses an undocumented feature which may get your app rejected when reviewed by Apple. Once Apple releases an official API this plugin will be updated of course. [People have used this approach __without problems__ though.](http://stackoverflow.com/questions/32526868/taptic-in-ios-9)

<img src="https://raw.githubusercontent.com/EddyVerbruggen/cordova-plugin-taptic-engine/master/taptic-6s-plus.jpg" width="541px" height="350px"/>

## Supported platforms
* iPhone 6s / 6s Plus or newer

## Installation

Latest stable version from npm:
```
$ cordova plugin add cordova-plugin-taptic-engine
```

Bleeding edge version from Github:
```
$ cordova plugin add https://github.com/EddyVerbruggen/cordova-plugin-taptic-engine
```

`TapticEngine.js` is brought in automatically.
It adds a global `TapticEngine` object which you can use to interact with the plugin.

## Usage

Check the [demo code](demo/index.html) for all the tricks in the book, or read on for some copy-pasteable samples.

Make sure to wait for `deviceready` before using any of these functions.

### `weakBoom`
This triggers the same effect as the 'Peek' in 'Peek & Pop', a very brief vibration.

```js
TapticEngine.weakBoom(
  function() {
    // note that unsupported iOS devices like the simulator also end up here, at the moment
    console.log("Boomed weakly, if available.");
  }, function () {
    console.log("You're running on Android. Meh.");
  }
);
```

### `strongBoom`
This triggers the 'Pop' effect of 'Peek & Pop', which is a bit more profound than the 'Peek' effect.

Codewise this is exactly the same as `weakBoom`, except for the function name of course.

### `burst`
This triggers the 'Nope' effect you get when fi. force touching a home icon which doesn't have any action. It's a short burst of 3-ish 'weak booms'.

Codewise this is exactly the same as `weakBoom` and `strongBoom`, except for the function name of course.

## Changelog
* 1.0.0  Initial release

## Future work
* Implement the official API. If any. Ever.
