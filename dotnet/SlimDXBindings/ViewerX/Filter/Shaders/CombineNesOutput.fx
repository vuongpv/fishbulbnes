Texture2D nesTexture;
Texture2D screenOne;
Texture2D screenTwo;
Texture2D backgroundPic;
Texture2D spriteMask;
Texture2D toolStrip;
Texture2D overLay;

float BackgroundBlendFactor;

SamplerState nesSampler
{
    Filter = MIN_MAG_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
};

SamplerState linearSampler
{
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = Wrap;
    AddressV = Wrap;
};

struct VS_IN
{
	float4 position : POSITION;
	float4 color : COLOR;
	float2 UV: TEXCOORD0;
};

struct PS_IN
{
	float4 position : SV_POSITION;
	float4 color : COLOR;
	float2 UV: TEXCOORD0;
};


PS_IN VS( VS_IN vertexShaderIn )
{
	PS_IN vertexShaderOut = (PS_IN)0;
	
	vertexShaderOut.position = vertexShaderIn.position;
	vertexShaderOut.color = vertexShaderIn.color;
	vertexShaderOut.UV = vertexShaderIn.UV;
	
	return vertexShaderOut;
}

float timer;

float4 PS( PS_IN pixelShaderIn ) : SV_Target
{
	// ignore bottom 16 pixels (nes-space), put in toolstrip instead
	if ((pixelShaderIn.UV.y * 15) > 14)
	{
		// clamp y 14/16-15/16 to newY (0-1)
		// ((y * 15) - 14)/16
		float y = pixelShaderIn.UV.y;
		
		float2 coords = float2(pixelShaderIn.UV.x, (y*15)-14);
		return toolStrip.Sample( linearSampler, coords);
	}

    float4 result = screenOne.Sample( linearSampler, pixelShaderIn.UV );
	
	float4 ol = overLay.Sample(linearSampler,  pixelShaderIn.UV );
	ol.a=0.05;
	result = (result * (1 - ol.a)) + (ol * ol.a);
	result.a = 1.0;

	return result;
	
}

float4 Combine( PS_IN pixelShaderIn ) : SV_Target
{


    float4 finalColor = screenOne.Sample( nesSampler, pixelShaderIn.UV );
    float4 finalSpriteColor = screenTwo.Sample( nesSampler, pixelShaderIn.UV );
    float4 spriteMaskColor = spriteMask.Sample( nesSampler, pixelShaderIn.UV );
    
	finalSpriteColor.a = 0;
	
	// if this is a foreground sprite, its alpha is the red component (foreground sprite) of the mask
	
	if (spriteMaskColor.r > 0.0 )
	{
		finalSpriteColor.a = spriteMaskColor.r;
	} 
	
	// if this is a background pixel, and there is a sprite here, the sprites alpha is green component (background sprite) of the mask
	if (spriteMaskColor.g > 0 )
	{
		if (finalColor.a > 0)
			finalSpriteColor.a = 1 - finalColor.a;
		else
			finalSpriteColor.a = spriteMaskColor.g;
	}

	float4 result = (finalSpriteColor * finalSpriteColor.a) + (finalColor * (1 - finalSpriteColor.a));
	
	return result;

}

technique10 Render
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, PS() ) );
	}
	
}

technique10 CombineNesOut
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, Combine() ) );
	}
	
}