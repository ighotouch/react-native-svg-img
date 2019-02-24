'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.SvgImageView = undefined;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _propTypes = require('prop-types');

var _propTypes2 = _interopRequireDefault(_propTypes);

var _reactNative = require('react-native');

var _ISvgImage = require('./ISvgImage');

var _ISvgImage2 = _interopRequireDefault(_ISvgImage);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var SvgImageView = exports.SvgImageView = function SvgImageView(_ref) {
  var height = _ref.height,
      source = _ref.source,
      width = _ref.width;

  var src = _reactNative.Image.resolveAssetSource(source);
  if (!src) return null;
  return _react2.default.createElement(_ISvgImage2.default, {
    style: { height: height, width: width },
    src: src.uri
  });
};

SvgImageView.propTypes = {
  height: _propTypes2.default.number.isRequired,
  source: _propTypes2.default.number.isRequired,
  width: _propTypes2.default.number.isRequired
};

exports.default = SvgImageView;