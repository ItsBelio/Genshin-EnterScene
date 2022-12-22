// Made with Amplify Shader Editor v1.9.0.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EnterScene"
{
	Properties
	{
		_MainColor("MainColor", Color) = (0,0,0,0)
		_Float0("Float 0", Range( 0 , 1)) = 0
		_YOffset("YOffset", Float) = -200
		_ZOffset("ZOffset", Float) = 0
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
		uniform float _ZOffset;
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
			float clampResult29 = clamp( _Float0 , -100.0 , 1.0 );
			float temp_output_23_0 = ( appendResult4.z - clampResult29 );
			float clampResult39 = clamp( temp_output_23_0 , 0.0 , 1.0 );
			float smoothstepResult54 = smoothstep( _Vector0.x , _Vector0.y , ( 1.0 - distance( _Float0 , appendResult4.z ) ));
			float3 appendResult20 = (float3(( saturate( temp_output_23_0 ) * _ZOffset ) , 0.0 , ( ( clampResult39 * _YOffset ) + ( _Vector0.z * smoothstepResult54 ) )));
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
-1876;123;1708;804;1069.544;614.9573;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;2;-1472,-267.5;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;3;-1281,-264.5;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.OneMinusNode;6;-1106,-263.5;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;-918,-264.5;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1159.367,292.8264;Inherit;False;Property;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0;1.485952;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;16;-743.3673,-176.1736;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ClampOpNode;29;-813.4807,163.3594;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;-100;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;57;-664.5342,428.3179;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;23;-646.7776,80.722;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;61;-644.8481,682.3453;Inherit;False;Property;_Vector0;Vector 0;4;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.95,1,0.3,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;58;-459.7457,538.5671;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;39;-464.5538,200.8875;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-488.3776,342.2221;Inherit;False;Property;_YOffset;YOffset;2;0;Create;True;0;0;0;False;0;False;-200;-200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;54;-358.5237,647.7543;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;40;-474.8536,70.08743;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-274.7776,248.722;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-470.481,-17.64059;Inherit;False;Property;_ZOffset;ZOffset;3;0;Create;True;0;0;0;False;0;False;0;-100;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-263.7457,450.5671;Inherit;False;2;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-259.481,-5.640594;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;59;-95.74573,303.5671;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;27;-491.2783,-456.278;Inherit;False;Property;_MainColor;MainColor;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.5660378,0.5059158,0.3924884,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;20;-108.3673,47.82642;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-310.5442,-251.9573;Inherit;False;Property;_Metallic;Metallic;5;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;65;-304.5442,-151.9573;Inherit;False;Property;_Smoothness;Smoothness;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;63;135,-334;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;EnterScene;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3;0;2;0
WireConnection;6;0;3;1
WireConnection;4;0;6;0
WireConnection;4;1;3;2
WireConnection;4;2;3;0
WireConnection;16;0;4;0
WireConnection;29;0;19;0
WireConnection;57;0;19;0
WireConnection;57;1;16;2
WireConnection;23;0;16;2
WireConnection;23;1;29;0
WireConnection;58;0;57;0
WireConnection;39;0;23;0
WireConnection;54;0;58;0
WireConnection;54;1;61;1
WireConnection;54;2;61;2
WireConnection;40;0;23;0
WireConnection;25;0;39;0
WireConnection;25;1;24;0
WireConnection;60;0;61;3
WireConnection;60;1;54;0
WireConnection;32;0;40;0
WireConnection;32;1;31;0
WireConnection;59;0;25;0
WireConnection;59;1;60;0
WireConnection;20;0;32;0
WireConnection;20;2;59;0
WireConnection;63;0;27;0
WireConnection;63;3;64;0
WireConnection;63;4;65;0
WireConnection;63;11;20;0
ASEEND*/
//CHKSM=1ECC788DB6F5D5A43AE4AC0C9C064F105795DFCF