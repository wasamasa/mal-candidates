var ffi = require('ffi');

var bindings = {
  'readline': ['string', ['string']],
  'add_history': ['int', ['string']]
};

var libreadline = ffi.Library('libreadline', bindings);

module.exports = {
  readline: libreadline.readline,
  add_history: libreadline.add_history
};
