// Made with Amplify Shader Editor v1.9.0.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Door"
{
	Properties
	{
		_MainColor("MainColor", Color) = (0,0,0,0)
		_Float0("Float 0", Range( 0 , 1.5)) = 0
		_YOffset("YOffset", Float) = -200
		_Vector0("Vector 0", Vector) = (0,0,0,0)
		_Metallic("Metallic", Float) = 0
		_Smoothness("Smoothness", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
		};

		uniform float _Float0;
		uniform float _YOffset;
		uniform float4 _Vector0;
		uniform float4 _MainColor;
		uniform float _Metallic;
		uniform float _Smoothness;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 break3 = v.color;
			float4 appendResult4 = (float4(( 1.0 - break3.g ) , break3.b , break3.r , 0.0));
			float clampResult29 = clamp( (-0.1 + (_Float0 - 0.0) * (1.0 - -0.1) / (1.0 - 0.0)) , -100.0 , 1.0 );
			float clampResult39 = clamp( ( appendResult4.y - clampResult29 ) , 0.0 , 1.0 );
			float smoothstepResult67 = smoothstep( _Vector0.x , _Vector0.y , ( 1.0 - distance( appendResult4.y , _Float0 ) ));
			float3 appendResult20 = (float3(0.0 , 0.0 , ( ( clampResult39 * _YOffset ) + ( _Vector0.z * smoothstepResult67 ) )));
			v.vertex.xyz += appendResult20;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _MainColor.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smoothness;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19001
-1876;123;1708;804;962.7697;618.7699;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;2;-1472,-267.5;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;3;-1281,-264.5;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.OneMinusNode;6;-1106,-263.5;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1440.168,222.9264;Inherit;False;Property;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0;1;0;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;-918,-264.5;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode;63;-1088.54,209.2783;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;16;-810.3673,-152.1736;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ClampOpNode;29;-853.4807,140.3594;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;-100;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;64;-807.4342,445.0705;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;65;-643.3337,530.5531;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;23;-594.7776,52.722;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;66;-741.7531,647.7957;Inherit;False;Property;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.95,1,0.3,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;67;-492.6731,632.1548;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-416.5194,160.3415;Inherit;False;Property;_YOffset;YOffset;2;0;Create;True;0;0;0;False;0;False;-200;-200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;39;-415.5538,-2.112503;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-296.9248,422.0748;Inherit;False;2;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-235.7328,12.08773;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;69;-126.0366,156.2999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-201.7697,-268.7699;Inherit;False;Property;_Metallic;Metallic;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;20;-64.3673,-47.17358;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;27;-285.2783,-495.278;Inherit;False;Property;_MainColor;MainColor;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.5647059,0.5058824,0.3921569,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;75;-195.7697,-168.7699;Inherit;False;Property;_Smoothness;Smoothness;5;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;71;135,-334;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Door;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3;0;2;0
WireConnection;6;0;3;1
WireConnection;4;0;6;0
WireConnection;4;1;3;2
WireConnection;4;2;3;0
WireConnection;63;0;19;0
WireConnection;16;0;4;0
WireConnection;29;0;63;0
WireConnection;64;0;16;1
WireConnection;64;1;19;0
WireConnection;65;0;64;0
WireConnection;23;0;16;1
WireConnection;23;1;29;0
WireConnection;67;0;65;0
WireConnection;67;1;66;1
WireConnection;67;2;66;2
WireConnection;39;0;23;0
WireConnection;68;0;66;3
WireConnection;68;1;67;0
WireConnection;25;0;39;0
WireConnection;25;1;24;0
WireConnection;69;0;25;0
WireConnection;69;1;68;0
WireConnection;20;2;69;0
WireConnection;71;0;27;0
WireConnection;71;3;74;0
WireConnection;71;4;75;0
WireConnection;71;11;20;0
ASEEND*/
//CHKSM=420DE7BFAE97649D1D3D08F4F1144E4168DC0A59