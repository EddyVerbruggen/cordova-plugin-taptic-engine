var exec = require("cordova/exec");

var TapticEngine = function () {};

TapticEngine.prototype.unofficial = {};


// Unofficial API (iPhone 6s +)
TapticEngine.prototype.unofficial.weakBoom = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "weakBoom", []);
};

TapticEngine.prototype.unofficial.strongBoom = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "strongBoom", []);
};

TapticEngine.prototype.unofficial.burst = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "burst", []);
};


// Official API (iPhone 7 +)
TapticEngine.prototype.notification = function (options, onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "notification", [options]);
};

TapticEngine.prototype.selection = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "selection", []);
};

TapticEngine.prototype.impact = function (options, onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "impact", [options]);
};

TapticEngine.prototype.gestureSelectionStart = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "gestureSelectionStart", []);
};

TapticEngine.prototype.gestureSelectionChanged = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "gestureSelectionChanged", []);
};

TapticEngine.prototype.gestureSelectionEnd = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "gestureSelectionEnd", []);
};

module.exports = new TapticEngine();
