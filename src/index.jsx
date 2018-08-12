import React from 'react';
import PropTypes from 'prop-types';
import { Image } from 'react-native';
import ISvgImage from './ISvgImage';

export const SvgImageView = ({ height, source, width }) => {
  const src = Image.resolveAssetSource(source);
  return (
    <ISvgImage
      style={{ height, width }}
      src={src.uri}
    />
  );
};

SvgImageView.propTypes = {
  height: PropTypes.number.isRequired,
  source: PropTypes.number.isRequired,
  width: PropTypes.number.isRequired,
};

export default SvgImageView;
