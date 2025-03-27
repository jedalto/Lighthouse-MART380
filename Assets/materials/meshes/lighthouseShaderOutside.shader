Shader "Custom/LighthouseShader"
{
    Properties
    {
        _Color1 ("Top Color", Color) = (0,0,0,1) // Black
        _Color2 ("Bottom Color", Color) = (1,1,1,1) // White
        _SplitPoint ("UV Split Point", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata_t
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 pos : SV_POSITION;
            };

            float4 _Color1;
            float4 _Color2;
            float _SplitPoint;

            v2f vert (appdata_t v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // Ensure the object is fully opaque
                fixed4 color = i.uv.y > _SplitPoint ? _Color1 : _Color2;
                return fixed4(color.rgb, 1.0); // Force alpha to 1 to prevent transparency issues
            }
            ENDCG
        }
    }
}
