var exec = require("cordova/exec");

var TapticEngine = function () {
};

TapticEngine.prototype.weakBoom = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "weakBoom", []);
};

TapticEngine.prototype.strongBoom = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "strongBoom", []);
};

TapticEngine.prototype.burst = function (onSuccess, onFail) {
  exec(onSuccess, onFail, "TapticEngine", "burst", []);
};

module.exports = new TapticEngine();
