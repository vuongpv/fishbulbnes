float4x4 matWorldViewProj : WORLDVIEWPROJECTION;

Texture2D texture2d;
Texture2D nesPal;
Texture2D chrRam;
Texture2D spriteSheet;
Texture2D spriteList;

int nesRamStart;
int NameTableMemoryStart;
int HScroll;
int VScroll;


SamplerState linearSampler
{
    Filter = MIN_MAG_MIP_POINT;

};

SamplerState palSampler
{
    Filter = MIN_MAG_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
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


float4 colorPal[64] = 
{
	float4(0.4726563, 0.4804688, 0.4726563, 1.0), 
	float4(0.046875, 0.1484375, 0.6328125, 1.0), 
	float4(0.15625, 0.0625, 0.6796875, 1.0), 
	float4(0.3671875, 0.04296875, 0.6289063, 1.0), 
	float4(0.5351563, 0.00390625, 0.4609375, 1.0), 
	float4(0.5742188, 0.01953125, 0.1640625, 1.0), 
	float4(0.5703125, 0.0625, 0.04296875, 1.0), 
	float4(0.4335938, 0.1484375, 0.015625, 1.0), 
	float4(0.2773438, 0.2539063, 0.015625, 1.0), 
	float4(0.078125, 0.3398438, 0.015625, 1.0), 
	float4(0.02734375, 0.3671875, 0.04296875, 1.0), 
	float4(0.0078125, 0.3242188, 0.1796875, 1.0), 
	float4(0.01953125, 0.2773438, 0.4257813, 1.0), 
	float4(0, 0, 0, 1.0), 
	float4(0.0078125, 0.0078125, 0.0078125, 1.0), 
	float4(0.0078125, 0.0078125, 0.0078125, 1.0), 
	float4(0.7460938, 0.75, 0.7460938, 1.0), 
	float4(0.0859375, 0.4101563, 0.8710938, 1.0), 
	float4(0.2929688, 0.2539063, 0.9296875, 1.0), 
	float4(0.5546875, 0.1523438, 0.8828125, 1.0), 
	float4(0.765625, 0.09765625, 0.7265625, 1.0), 
	float4(0.828125, 0.125, 0.3867188, 1.0), 
	float4(0.828125, 0.2148438, 0.1289063, 1.0), 
	float4(0.7070313, 0.3515625, 0.05078125, 1.0), 
	float4(0.5390625, 0.4765625, 0.015625, 1.0), 
	float4(0.2265625, 0.5703125, 0.02734375, 1.0), 
	float4(0.078125, 0.6015625, 0.09375, 1.0), 
	float4(0.03515625, 0.5976563, 0.3515625, 1.0), 
	float4(0.03515625, 0.5429688, 0.6601563, 1.0), 
	float4(0.1757813, 0.1835938, 0.1757813, 1.0), 
	float4(0.01171875, 0.01171875, 0.01171875, 1.0), 
	float4(0.01171875, 0.01171875, 0.01171875, 1.0), 
	float4(0.9570313, 0.9609375, 0.96875, 1.0), 
	float4(0.2851563, 0.6953125, 0.96875, 1.0), 
	float4(0.5351563, 0.578125, 0.9882813, 1.0), 
	float4(0.7578125, 0.4726563, 0.9765625, 1.0), 
	float4(0.9140625, 0.4335938, 0.9257813, 1.0), 
	float4(0.953125, 0.4570313, 0.7265625, 1.0), 
	float4(0.9648438, 0.5117188, 0.421875, 1.0), 
	float4(0.9296875, 0.6328125, 0.2695313, 1.0), 
	float4(0.8398438, 0.75, 0.1328125, 1.0), 
	float4(0.5976563, 0.828125, 0.125, 1.0), 
	float4(0.3125, 0.8671875, 0.265625, 1.0), 
	float4(0.2382813, 0.8632813, 0.578125, 1.0), 
	float4(0.1679688, 0.84375, 0.8671875, 1.0), 
	float4(0.3867188, 0.3984375, 0.390625, 1.0), 
	float4(0.015625, 0.015625, 0.015625, 1.0), 
	float4(0.015625, 0.015625, 0.015625, 1.0), 
	float4(0.96875, 0.9726563, 0.9765625, 1.0), 
	float4(0.703125, 0.8671875, 0.9765625, 1.0), 
	float4(0.796875, 0.8164063, 0.9882813, 1.0), 
	float4(0.8710938, 0.7734375, 0.9804688, 1.0), 
	float4(0.9453125, 0.75, 0.9648438, 1.0), 
	float4(0.9609375, 0.7617188, 0.8867188, 1.0), 
	float4(0.9648438, 0.796875, 0.7617188, 1.0), 
	float4(0.9570313, 0.8515625, 0.6757813, 1.0), 
	float4(0.921875, 0.8984375, 0.5976563, 1.0), 
	float4(0.8203125, 0.9257813, 0.609375, 1.0), 
	float4(0.71875, 0.9414063, 0.703125, 1.0), 
	float4(0.6875, 0.9453125, 0.8476563, 1.0), 
	float4(0.6484375, 0.9375, 0.9453125, 1.0), 
	float4(0.78125, 0.7773438, 0.78125, 1.0), 
	float4(0.1953125, 0.953125, 0.03125, 1.0), 
	float4(0.1953125, 0.953125, 0.03125, 1.0),
	//float4(0.01953125, 0.01953125, 0.01953125, 1.0), 
	//float4(0.01953125, 0.01953125, 0.01953125, 1.0),
	
};

//
// VERTEX SHADER
//
//
//

PS_IN VS( VS_IN vertexShaderIn )
{
	PS_IN vertexShaderOut = (PS_IN)0;
	
	vertexShaderOut.position = vertexShaderIn.position;
	//vertexShaderOut.position = mul(vertexShaderIn.position, matWorldViewProj);

	vertexShaderOut.color = vertexShaderIn.color;
	vertexShaderOut.UV = vertexShaderIn.UV;
	
	return vertexShaderOut;
}


float4 hsv_to_rgb(float3 HSV)
{
    float3 RGB = HSV.z;
    if ( HSV.y != 0 ) {
       float var_h = HSV.x * 6;
       float var_i = floor(var_h);   // Or ... var_i = floor( var_h )
       float var_1 = HSV.z * (1.0 - HSV.y);
       float var_2 = HSV.z * (1.0 - HSV.y * (var_h-var_i));
       float var_3 = HSV.z * (1.0 - HSV.y * (1-(var_h-var_i)));
       if      (var_i == 0) { RGB = float3(HSV.z, var_3, var_1); }
       else if (var_i == 1) { RGB = float3(var_2, HSV.z, var_1); }
       else if (var_i == 2) { RGB = float3(var_1, HSV.z, var_3); }
       else if (var_i == 3) { RGB = float3(var_1, var_2, HSV.z); }
       else if (var_i == 4) { RGB = float3(var_3, var_1, HSV.z); }
       else                 { RGB = float3(HSV.z, var_1, var_2); }
   }
   return float4(RGB.x, RGB.y, RGB.z, 1.0);
}


float hue = 15;
//float colorAngles[16] = {0,240,210,180,150,120,90,60,30,0,330,300,270,0,0,0};
float colorAngles[16] = 
{0, // sin =  -1.0f, cos = 0
240, // sin = -0.866, cos = -0.5
210,  // sin = -0.5, cos = -0.86
180,  //
150,
120,
90,
60,
30,
0,
330,
300,
270,
0,
0,
0};

float lo_levels [4] = { -0.12f, 0.00f, 0.31f, 0.72f };
float hi_levels [4] = {  0.40f, 0.68f, 1.00f, 1.00f };
float phases [0x10 + 3] = {
		-1.0f, -0.86602540378443864676372317075294, -0.5f, 0.0f,  0.5f,  0.86602540378443864676372317075294,
		 1.0f,  0.86602540378443864676372317075294,  0.5f, 0.0f, -0.5f, -0.86602540378443864676372317075294,
		-1.0f, -0.86602540378443864676372317075294, -0.5f, 0.0f,  0.5f,  0.86602540378443864676372317075294,
		 1.0f
	};
	
#define TO_ANGLE_SIN( color )   phases [color]
#define TO_ANGLE_COS( color )   phases [(color) + 3]


//76543210
//||||||||
//||||++++- Hue
//||++----- Value
//++------- Unused

float contrast = 0.40;   /* -1 = dark (0.5)       +1 = light (1.5) */
float brightness = 0.2; /* -1 = dark (0.5)       +1 = light (1.5) */

float3x3 YIQToRGBMatrix = 
{
 1.0, 0.9559999, 0.621000051,
 1.0, -0.271999955, -0.647, 
 1.0, -1.10500014, 1.7019999 
};


// 1.0, -9
float3 DecodePixel(int pixel, int tintBits)
{
	int level = pixel >> 4 & 0x03;
	
	float lo = lo_levels [level];
	float hi = hi_levels [level];
	
	int color = pixel & 0x0F;
	if ( color == 0 )
		lo = hi;
	if ( color == 13 )
		hi = lo;
	if ( color > 13 )
		hi = lo = 0.0f;
		
	/* Convert raw waveform to YIQ */
	float sat = (hi - lo) * 0.5f;
	
	float3 yiq = float3((hi + lo) * 0.5f, 
						sin(radians(colorAngles[color] + hue )) * sat, 
						cos( radians(colorAngles[color] + hue) ) * sat * -1);
	
	/* Apply brightness, contrast, and gamma */
	yiq.x *= (float) (contrast * 0.5f) + 1;
	/* adjustment reduces error when using input palette */
	yiq.x += (float) (brightness * 0.5f) - (0.5f / 256.0f);	
	
	if ( tintBits > 0 && pixel <= 13 )
	{
		float atten_mul = 0.79399f;
		float atten_sub = 0.0782838f;
		
		if ( tintBits == 7 )
		{
			yiq.x = yiq.x * (atten_mul * 1.13f) - (atten_sub * 1.13f);
		}
		else
		{
			int tints [8] = { 0, 6, 10, 8, 2, 4, 0, 0 };
			int tint_color = tints [tintBits];
			float sat = hi * (0.5f - atten_mul * 0.5f) + atten_sub * 0.5f;
			yiq.x -= sat * 0.5f;
			if ( tintBits >= 3 && tintBits != 4 )
			{
				/* combined tint bits */
				sat *= 0.6f;
				yiq.x -= sat;
			}
			yiq.y += TO_ANGLE_SIN( tint_color ) * sat;
			yiq.z += TO_ANGLE_COS( tint_color ) * sat;
		}
	}

	float3 rgb_bias = float3(1.0, 1.0, 1.0);

	float3 rgb1 = mul( yiq , YIQToRGBMatrix);// * rgb_bias;

	return rgb1 * rgb_bias;
}


uint4 FetchSpriteRam(int spriteIndex)
{
	float4 ramEntry = texture2d.Load(int3(spriteIndex,  255 , 0));
	return uint4( ramEntry[0] * 255.0,
		ramEntry[1] * 255.0,
		ramEntry[2] * 255.0,
		ramEntry[3] * 255.0);
}





int ppuBankStarts[16] = {
    0,
    1024,
    2048,
    3072,
    4096,
    5120,
    6144,
    7168,
    8192,
    9216,
    10240,
    11264,
    12288,
    13312,
    14336,
    15360	
};// =  


int GetByte(int address)
{
	
	int bank = address / 0x400;
	int newAddress = ppuBankStarts[bank] + (address & 0x3FF);
	
	int y = (newAddress / 1024);
	int x = (newAddress & 1023);
	float4 byte = chrRam.Load(int3(x/4,y,0));
	
	int result = byte[x & 3] * 255;
	return result;
}

int WhissaSpritePixel(int patternTableIndex, int x, int y, bool flipX, bool flipY, int spriteSize, int tileIndex)
{
	// 8x8 tile
	uint patternEntry;
	uint patternEntryBit2;

	if (flipY)
	{
		y = spriteSize - y - 1;
	}

	if (y >= 8)
	{
		y += 8;
	}

	patternEntry = GetByte(patternTableIndex + (tileIndex * 16) + y);
	patternEntryBit2 = GetByte(patternTableIndex + (tileIndex * 16) + y + spriteSize);

	return 
		(flipX ?
		((patternEntry >> x) & 0x1) | (((patternEntryBit2 >> x) << 1) & 0x2)
		: ((patternEntry >> (7 - x)) & 0x1) | (((patternEntryBit2 >> (7 - x)) << 1) & 0x2));
}


bool PeepSprite(int spriteNum, int currentXPosition, int currentYPosition)
{

	// if these are 8x16 sprites, read high and low, draw
	uint4 spriteData = FetchSpriteRam(spriteNum);
	//int spriteData = spriteRam[spriteNum];
	
	uint y = spriteData[0];
	uint x = spriteData[3];
	
	if ( (x > 0 && currentXPosition >= x && currentXPosition < x + 8) )
		{
			return true;
		}
	
	return false;
}



int DrawSprite(int spriteNum, int currentXPosition, int currentYPosition, int ppuByte0, int ppuByte1)
{
	// if these are 8x16 sprites, read high and low, draw
	//uint spriteData = spriteRam[spriteNum];
	int4 spriteData = FetchSpriteRam(spriteNum);
	
	uint x = spriteData[3];//  (spriteData >> 24) & 0xFF ;
	uint attributeByte  = spriteData[2]; // (spriteData >> 16) & 0xFF;
	uint tileIndex = spriteData[1]; // (spriteData >> 8) & 0xFF;
	uint y = spriteData[0]; // spriteData & 0xFF;
	
	int attrColor = ((attributeByte & 0x03) << 2) | 16;
	bool isInFront = (attributeByte & 32) != 32;
	bool flipX = (attributeByte & 0x40) == 0x40;
	bool flipY = (attributeByte & 0x80) == 0x80;
	int spriteSize= (ppuByte0 & 32) ? 16 : 8;


	int spritePatternTable = 0;
	if ((ppuByte0 & 0x08) == 0x08)
	{
		spritePatternTable = 0x1000;
	}
	int xPos = currentXPosition - x;
	int yLine = currentYPosition - y ;

	yLine = yLine & (spriteSize - 1);


	if ((ppuByte0 & 0x20) == 0x20)
	{
		if ((tileIndex & 1) == 1)
		{
			spritePatternTable = 0x1000;
			tileIndex = tileIndex ^ 1;
		}
		else
		{
			spritePatternTable = 0;
		}
	}
	int result = WhissaSpritePixel(spritePatternTable, xPos, yLine, flipX, flipY, spriteSize, tileIndex);
	if (isInFront)
	{
		result |= 128;
	}

	return result;
}

int _backgroundPatternTableIndex=4096;

int GetAttributeTableEntry(int ppuNameTableMemoryStart, int i, int j)
{
	int LookUp = GetByte(0x2000 + ppuNameTableMemoryStart + 0x3C0 + (i >> 2) + ((j >> 2) * 0x8)); 

	switch ((i & 2) | (j & 2) * 2)
	{
		case 0:
			return (LookUp << 2) & 12;
		case 2:
			return LookUp & 12;
		case 4:
			return (LookUp >> 2) & 12;
		case 6:
			return (LookUp >> 4) & 12;
	}
	return 0;
}

int GetNameTablePixel(int xPosition, int yPosition, int ppuByte0, int ppuByte1, int nameTableMemoryStart)
{
	// current palette index in a
	// tileIndex in r, spriteIndex in g, isSprite in b
	// calculate the address of the nes palette value in the palCache
	
	int _backgroundPatternTableIndex = ((ppuByte0 & 0x10) >> 4) * 0x1000;	
	
	int ppuNameTableMemoryStart = nameTableMemoryStart;

	int xTilePosition = xPosition >> 3;

	uint tileRow = (yPosition >> 3) % 30 << 5;

	int tileNametablePosition = 0x2000 + ppuNameTableMemoryStart 
		+ xTilePosition + tileRow;

	int TileIndex = GetByte(tileNametablePosition);

	int patternTableYOffset = yPosition & 7;

	int patternID = _backgroundPatternTableIndex 
		+ (TileIndex * 16) + patternTableYOffset;

	int patternEntry = GetByte(patternID);
	int patternEntryByte2 = GetByte(patternID + 8);

	int patternTableEntryIndex = 7 - (xPosition & 7);

	// return 3;
	//currentAttributeByte = 
	int result = (((patternEntry >> patternTableEntryIndex) & 1)
		| (((patternEntryByte2 >> patternTableEntryIndex) & 1) << 1)
					);
					
	if (result != 0) 
	{
		int attributeByte = GetAttributeTableEntry(ppuNameTableMemoryStart, xTilePosition, yPosition >> 3);
		result |= attributeByte;
	}
	
	return result;

	
	
}

float4 DrawTilesFromRAM(PS_IN pixelShaderIn) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	int ppuByte0 = finalColor.g * 255.0;	
    int ppuByte1 = finalColor.b * 255.0;	
    int nameTableMemoryStart = (0x400 * (ppuByte0 & 0x3));
	
	int ntPixel =(ppuByte1 & 0x08) ? GetNameTablePixel(pixelShaderIn.UV.x * 255.0, pixelShaderIn.UV.y * 255.0, ppuByte0, ppuByte1, nameTableMemoryStart) : 0;

	float r = ntPixel / 32.0;
	// this lookup is 8 columns wide
	float2 palAddy = float2( r, finalColor.a  );

	// get the nes palette entry (will contain 4 values)
	//float4 rVal = nesPal.Sample(palSampler, palAddy );	
	float4 rVal = nesPal.Load(int3(ntPixel/4,finalColor.a * 255,0));

	return float4(DecodePixel(rVal[ntPixel & 3] * 255, 0), 1.0 );
}

float4 CreateTileMask( PS_IN pixelShaderIn ) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	int ppuByte0 = finalColor.g * 255.0;	
    int ppuByte1 = finalColor.b * 255.0;	
    int nameTableMemoryStart = (0x400 * (ppuByte0 & 0x3));
	
	int ntPixel =(ppuByte1 & 0x08) ? GetNameTablePixel(pixelShaderIn.UV.x * 255.0, pixelShaderIn.UV.y * 255.0, ppuByte0, ppuByte1, nameTableMemoryStart) : 0;

	if (ntPixel > 0)
		return float4(1,0,0,1);
	else
		return float4 (0,0,0,0);

}


int spriteStart=0;

uint UnpackUINT(float4 data)
{
	uint l = (uint)(data[3] * 255.0) << 24;
	l |= (uint)(data[2] * 255.0) << 16;
	l |= (uint)(data[1] * 255.0) << 8;
	l |= (uint)(data[0] * 255.0);
	return l;
}

bool IsSpriteOnLine(int lineNum, int spriteNum)
{

	if (spriteNum < 32)
	{
		float4 lineData = texture2d.Load(int3(lineNum, 253, 0));
		uint l = UnpackUINT(lineData);

		return (l & (1 << (spriteNum )));
	} else
	{
		float4 lineData = texture2d.Load(int3(lineNum, 254, 0));
		uint l = UnpackUINT(lineData);
		return (l & (1 << (spriteNum - 32 )));
	}
	return false;
}

float4 DrawSpritesFromRAM(PS_IN pixelShaderIn) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	int ppuByte0 = finalColor.g * 255.0;	
	int ppuByte1 = finalColor.b * 255.0;	
	float2 xy = (pixelShaderIn.UV) * 255.0;
    // first 32 sprites
	int spriteCount=0;
	
	//for (int spriteNum = spriteStart; spriteNum < spriteStart + 8; ++spriteNum)
	for(int spriteNum=0; spriteNum < 64; ++spriteNum)
	{
		int j;
		int offset=0;
		if (spriteNum < 32)
		{
			j = spriteNum;
		}
		else
		{
			j = spriteNum - 32;
			offset=1;
		}
		
		if (IsSpriteOnLine(xy.y, spriteNum) && PeepSprite(spriteNum, xy.x, xy.y))
		{
			spriteCount++;
			if (spriteCount > 64) 
				return float4(0,0,0,0);
			int ntPixel = DrawSprite(spriteNum, xy.x , xy.y, ppuByte0, ppuByte1);
			ntPixel &=31;
			if (ntPixel > 0)
			{
				ntPixel |=16;
				// get the nes palette entry (will contain 4 values)
				//float4 rVal = nesPal.Sample(palSampler, palAddy );	
				float4 rVal = nesPal.Load(int3(ntPixel/4,finalColor.a * 255,0));
				int pixel = rVal[ntPixel & 3] * 255;
				return float4(DecodePixel(pixel, 0), 1.0 );
			}

		}
		
	}
	return float4(0,0,0,0);
}

float4 CreateSpriteMask( PS_IN pixelShaderIn ) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	int ppuByte0 = finalColor.g * 255.0;	
	int ppuByte1 = finalColor.b * 255.0;	
	float2 xy = (pixelShaderIn.UV) * 255.0;
    // first 32 sprites
	int spriteCount=0;
	
	//for (int spriteNum = spriteStart; spriteNum < spriteStart + 8; ++spriteNum)
	for(int spriteNum=0; spriteNum < 64; ++spriteNum)
	{
		int j;
		int offset=0;
		if (spriteNum < 32)
		{
			j = spriteNum;
		}
		else
		{
			j = spriteNum - 32;
			offset=1;
		}
		
		if (IsSpriteOnLine(xy.y, spriteNum) && PeepSprite(spriteNum, xy.x, xy.y))
		{
			spriteCount++;
			if (spriteCount > 64) 
				return float4(0,0,0,0);
			int ntPixel = DrawSprite(spriteNum, xy.x , xy.y, ppuByte0, ppuByte1);
			if (ntPixel > 0 && ntPixel != 128)
			{
				if (ntPixel > 128)
				{
					return float4(1,0,0, 1.0 );
				} else 
				{
					return float4(0,1,0,1);
				}
			}

		}
		
	}
	return float4(0,0,0,0);

}




float4 DrawSpriteSquaresFromRAM(PS_IN pixelShaderIn) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	int ppuByte0 = finalColor.g * 255.0;	
	int ppuByte1 = finalColor.b * 255.0;	
	
	int tintBits = (ppuByte1 >>5) & 0x7;
	float2 xy = (pixelShaderIn.UV) * 255.0;
	

	int spriteNum=0;
	while (spriteNum++ < 64)
	{

		if (IsSpriteOnLine(xy.y, spriteNum) && PeepSprite(spriteNum, xy.x, xy.y))
		{
			return float4(DecodePixel(spriteNum + 1,tintBits),1.0);
		}
	}
	return float4(0,0,0,1);
}

float4 DrawTilesOnly( PS_IN pixelShaderIn ) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	// current palette index in a
	// tileIndex in r, spriteIndex in g, isSprite in b
	// calculate the address of the nes palette value in the palCache
	
	int col = finalColor.r * 255.0;
	col &= 15;
    int ppuByte1 = finalColor.b * 255.0;
	
	int tintBits = (ppuByte1 >>5) & 0x7;
	
	bool clipTiles = (ppuByte1 & 0x2) == 0x0;

	float r = col / 32.0;
	// this lookup is 8 columns wide
	float2 palAddy = float2( r, finalColor.a  );

	// get the nes palette entry (will contain 4 values)
	float4 rVal = nesPal.Sample(palSampler, palAddy);
    bool clipSprites = (ppuByte1 & 0x4) == 0x0;
    
    if ( clipTiles && pixelShaderIn.UV.x  < 0.03125)
	{
		return float4(0,0,0,0);
	}else
	{
		// float alpha = col == 0 ? 0 : 1.0;
		return float4(DecodePixel(rVal[col & 3] * 255, tintBits), 1.0 );
	}
}


float4 DrawSpritesOnly( PS_IN pixelShaderIn ) : SV_Target
{
	float4 finalColor = texture2d.Sample( linearSampler, pixelShaderIn.UV );
	// tileIndex in r, spriteIndex in g, isSprite in b
	
	// int ppuByte = finalColor.g * 255.0;
	int ppuByte1 = finalColor.b * 255.0;
	int tintBits = (ppuByte1 >> 5) & 0x7;
	
	int col = (int)(finalColor.r * 255.0) >> 4;
	col &= 15;
	col +=16;
	// current palette index in a
	// tileIndex in r, spriteIndex in g, isSprite in b
	// calculate the address of the nes palette value in the palCache
	float r = col / 32.0;
	// this lookup is 8 columns wide
	float2 palAddy = float2( r, finalColor.a  );

	// get the nes palette entry (will contain 4 values)
	float4 rVal = nesPal.Sample(palSampler, palAddy);


	return float4(DecodePixel(rVal[col & 3] * 255, tintBits), col );

}




technique10 RenderTiles
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, DrawTilesOnly() ) );
	}
	
}

technique10 RenderSprites
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, DrawSpritesOnly() ) );
	}
	
}


technique10 RenderSpriteMask
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, CreateSpriteMask() ) );
	}
	
}

technique10 RenderTileMask
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, CreateTileMask() ) );
	}
	
}

technique10 RenderTileRAM
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, DrawTilesFromRAM() ) );
	}
	
}

technique10 RenderSpriteRAM
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, DrawSpritesFromRAM() ) );
	}
	
}


technique10 RenderSpriteSquares
{
	pass P0
	{
		SetGeometryShader( 0 );
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, DrawSpriteSquaresFromRAM() ) );
	}
	
}
