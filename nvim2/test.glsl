#ifdef GL_FRAGMENT_PRECISION_HIGH
   precision highp float;
#else
   precision mediump float;
#endif

#ifdef COLORFACTOR
   uniform vec4 u_ColorFactor;
#endif

#ifdef DIFFUSEMAP
   varying vec3 v_Texcoord;
   uniform vec4 u_MainParam;
   uniform sampler2D u_texture;

   #ifdef USE_MAIN_POLAR
      uniform vec4 u_MainPolar;
   #endif // USE_MAIN_POLAR
#endif

// 主纹理通道
#ifdef MAIN_TEX_CHANNEL
   uniform vec4 u_MainTexChannel;
#endif
// 遮罩纹理通道
#ifdef MASK_TEX_CHANNEL
   uniform vec4 u_MaskTexChannel;
#endif
// 溶解纹理通道
#ifdef DISSOLVE_TEX_CHANNEL
   uniform vec4 u_DissolveTexChannel;
#endif
// 扭曲纹理通道
#ifdef WARP_TEX_CHANNEL
   uniform vec4 u_WarpTexChannel;
#endif

#ifdef MASKMAP
   varying vec2 v_Texcoord2;
   uniform sampler2D u_texMask;
#endif 

#ifdef DISSOLVEMAP
   varying vec3 v_DissolveUVThreshold;
   uniform float u_DissolveWidth;
   uniform vec4 u_DissolveColor;
   uniform vec4 u_DissolveParam;
   uniform sampler2D u_texDissolve;

   #ifdef USE_DISSOLVE_POLAR
      uniform vec4 u_DissolvePolar;
   #endif // USE_DISSOLVE_POLAR
#endif

#ifdef WARPMAP
   varying vec2 v_WarpUv;
   uniform sampler2D u_texWarp;
   uniform float u_Time;
   uniform vec4 u_WarpMask;
   uniform vec4 u_WarpParam;
#endif

#ifdef LIMIT_Y
   varying vec3 v_worldYLimitYFadeRange;
#endif

varying vec4 v_Color;

vec4 getChannelColor0(vec4 color, vec4 mask)
{
   vec4 maskColor = color * mask;
   float v = max(maskColor.r, max(maskColor.g, max(maskColor.b, maskColor.a)));
   return vec4(v, v, v, v);
}

vec4 getChannelColor(vec4 color, vec4 mask)
{
   vec4 maskColor = color * mask;
   float v = max(maskColor.r, max(maskColor.g, max(maskColor.b, maskColor.a)));
   return mix(vec4(1.0, 1.0, 1.0, v), color, step(1.0, mask.a));
}

void main()
{
   float alpha = 1.0;
   float colorMulti = 1.0;
   vec2 warpUV = vec2(0.0, 0.0);
   vec4 warpMask = vec4(0.0, 0.0, 0.0, 0.0);
   vec4 maskColor = vec4(1.0, 1.0, 1.0, 1.0);

   // 扭曲
   #ifdef WARPMAP
      vec4 warpColor = texture2D(u_texWarp, v_WarpUv + vec2(u_WarpParam.x, -u_WarpParam.y) * u_Time);
      #ifdef MASK_TEX_CHANNEL
         warpColor = getChannelColor0(warpColor, u_WarpTexChannel);
      #endif // MASK_TEX_CHANNEL
      warpUV = warpColor.xy * u_WarpParam.z;
      warpMask = u_WarpMask;
   #endif // WARPMAP

   #ifdef DIFFUSEMAP
      float normalizeAge = v_Texcoord.z;
      vec2 mainUV      = v_Texcoord.xy;
      
      // 主纹理极坐标
      #ifdef USE_MAIN_POLAR
         vec2 centerUV = mainUV - vec2(0.5, 0.5);
         mainUV.x = (atan(centerUV.x, centerUV.y) / 6.28318548202515 + 0.5) * u_MainPolar.z - u_MainPolar.x * normalizeAge;
         mainUV.y = (1.0 - length(centerUV)) * u_MainPolar.w - u_MainPolar.y * normalizeAge;
      #endif // USE_MAIN_POLAR

      vec4 color = texture2D(u_texture, mainUV + warpUV * warpMask.x);

      #ifdef MAIN_TEX_CHANNEL
         color = getChannelColor(color, u_MainTexChannel);
      #endif // MAIN_TEX_CHANNEL

      // R 作为 Alpha 通道
      alpha = u_MainParam.y * color.r + (1.0 - u_MainParam.y) * color.a;
      colorMulti = u_MainParam.x;

      gl_FragColor = color * v_Color;

      #ifdef PREMULTIALPHA
         gl_FragColor.rgb *= gl_FragColor.a;
      #endif // PREMULTIALPHA

      // 遮罩
      #ifdef MASKMAP
         maskColor = texture2D(u_texMask, v_Texcoord2 + warpUV * warpMask.y);
         #ifdef MASK_TEX_CHANNEL
            maskColor = getChannelColor(maskColor, u_MaskTexChannel);
         #endif // MASK_TEX_CHANNEL

         #ifdef PREMULTIALPHA
            maskColor.rgb *= maskColor.a;
         #endif // PREMULTIALPHA
      #endif // MASKMAP

      // 溶解
      #ifdef DISSOLVEMAP
         vec2 dissUV = v_DissolveUVThreshold.xy;
         // 极坐标
         #ifdef USE_DISSOLVE_POLAR
            vec2 dissCenterUV = dissUV - vec2(0.5, 0.5);
            dissUV.x = (atan(dissCenterUV.x, dissCenterUV.y) / 6.28318548202515 + 0.5) * u_DissolvePolar.z - u_DissolvePolar.x * normalizeAge;
            dissUV.y = (1.0 - length(dissCenterUV)) * u_DissolvePolar.w - u_DissolvePolar.y * normalizeAge;
         #endif // USE_DISSOLVE_POLAR

         vec4 dissolveColor = texture2D(u_texDissolve, dissUV + warpUV * warpMask.z);
         #ifdef DISSOLVE_TEX_CHANNEL
            dissolveColor = getChannelColor0(dissolveColor, u_DissolveTexChannel);
         #endif // DISSOLVE_TEX_CHANNEL
         float delta = dissolveColor.r - v_DissolveUVThreshold.z;
         float dissolveAlpha = max(min(1.0, delta / u_DissolveParam.x), 0.0);
         float hardColorLerp = step ? (1.0, delta / u_DissolveParam.y);
         float softColorLerp = max(min(1.0, delta / u_DissolveParam.y), 0.0);
         gl_FragColor = mix(u_DissolveColor, gl_FragColor, mix(hardColorLerp, softColorLerp, u_DissolveParam.z));
         alpha *= dissolveAlpha;
      #endif // DISSOLVEMAP
   #else
      gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
   #endif

   #ifdef COLORFACTOR
      gl_FragColor *= u_ColorFactor;
   #endif // COLORFACTOR

   #ifdef LIMIT_Y
      alpha *= max(min(1.0, (v_worldYLimitYFadeRange.x - v_worldYLimitYFadeRange.y) / v_worldYLimitYFadeRange.z), 0.0);
   #endif // LIMIT_Y

   gl_FragColor *= colorMulti * maskColor;
   gl_FragColor.a *= alpha;

#ifdef PREMULTIPLIED_ALPHA
   gl_FragColor.rgb *= gl_FragColor.a;
#endif // PREMULTIPLIED_ALPHA
}



