package com.rctsvg;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.ViewGroup;

import com.caverock.androidsvg.SVG;
import com.caverock.androidsvg.SVGImageView;
import com.caverock.androidsvg.SVGParseException;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.views.imagehelper.ImageSource;
import com.facebook.react.views.imagehelper.ResourceDrawableIdHelper;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import okhttp3.Response;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import retrofit2.http.Path;
import retrofit2.http.Url;

public class RNSvgImageManager extends SimpleViewManager<SVGImageView> {
    public static final String REACT_CLASS = "ISvgImage";
    @Override
    public String getName() {
        return REACT_CLASS;
    }

    ThemedReactContext reactContext;

    @Override
    protected SVGImageView createViewInstance(ThemedReactContext reactContext) {
        this.reactContext = reactContext;
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
    public void setSrc(final SVGImageView svgImageView,  @Nullable String sources) {
        ImageSource source = new ImageSource(reactContext, sources);
        if(source.isResource()) {
            int resourceDrawableId = ResourceDrawableIdHelper.getInstance().getResourceDrawableId(reactContext, sources);
            SVG svg = null;
            try {
                svg = SVG.getFromResource(reactContext, resourceDrawableId);
                svgImageView.setSVG(svg);
            } catch (SVGParseException e) {
                e.printStackTrace();
            }
        }else{
            Uri uri = source.getUri();
            String path = uri.toString();
            try{
                URL url = new URL(sources);
                Retrofit retrofit = new Retrofit.Builder()
                        .baseUrl("http://localhost:8081/")
                        .build();

                GitHubService service = retrofit.create(GitHubService.class);
                Call<ResponseBody> repos = service.getImage(path);
                repos.enqueue(new Callback<ResponseBody>() {
                    @Override
                    public void onResponse(Call<ResponseBody> call, retrofit2.Response<ResponseBody> response) {
                        ResponseBody body = response.body();
                        try {
                            InputStream value = body.byteStream();
                            SVG svg = SVG.getFromInputStream(value);
                            svgImageView.setSVG(svg);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                    @Override
                    public void onFailure(Call<ResponseBody> call, Throwable t) {
                        Log.d("SvgNetworkFailure", t.getMessage());
                    }
                });
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public interface GitHubService {
        @GET
        Call<ResponseBody> getImage(@Url String url);
    }
}
