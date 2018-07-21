package com.rctsvg;

import android.support.annotation.Nullable;
import android.view.ViewGroup;

import com.caverock.androidsvg.SVG;
import com.caverock.androidsvg.SVGImageView;
import com.caverock.androidsvg.SVGParseException;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

public class RNSvgImageManager extends SimpleViewManager<SVGImageView> {
    public static final String REACT_CLASS = "RNSvgImage";
    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    protected SVGImageView createViewInstance(ThemedReactContext reactContext) {
        try {
            SVG svg = SVG.getFromString("<svg />");
            SVGImageView svgImageView = new SVGImageView(reactContext);
            svgImageView.setSVG(svg);
            svgImageView.setLayoutParams(
                    new ViewGroup.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.MATCH_PARENT));

            return svgImageView;

        } catch (SVGParseException e){
            e.printStackTrace();
        }
        return null;

    }

    @ReactProp(name = "src")
    public void setSrc(SVGImageView svgImageView, @Nullable String sources) {
        SVG svg = null;
        try {
            svg = SVG.getFromString(sources);
            svgImageView.setSVG(svg);
        } catch (SVGParseException e) {
            e.printStackTrace();
        }
    }
}
