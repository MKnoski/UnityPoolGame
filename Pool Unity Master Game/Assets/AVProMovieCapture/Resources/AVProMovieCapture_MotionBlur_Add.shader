Shader "Hidden/MotionBlur/Add" 
{
	Properties 
	{
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}

	SubShader 
	{
		Pass 
		{
			ZTest Always Cull Off ZWrite Off
			Fog { Mode off }
			Blend One One
			
			CGPROGRAM
			#pragma exclude_renderers flash xbox360 ps3 gles
			#pragma vertex vert_img
			#pragma fragment frag
			//#pragma target 3.0
			//#pragma fragmentoption ARB_precision_hint_fastest 
			#include "UnityCG.cginc"
			
			uniform sampler2D _MainTex;
			uniform float _Weight;

			fixed4 frag (v2f_img i) : COLOR
			{
				float4 col = tex2D(_MainTex, i.uv) * _Weight;
				return col;
			}
			ENDCG	
		}	
	}

Fallback off
}