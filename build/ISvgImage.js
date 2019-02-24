'use strict';

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; /* eslint-disable import/no-unresolved */


var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _reactNative = require('react-native');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var iface = {
  name: 'ISvgImage',
  propTypes: _extends({
    src: _propTypes2.default.string
  }, _reactNative.ViewPropTypes)
};

module.exports = (0, _reactNative.requireNativeComponent)('ISvgImage', iface);