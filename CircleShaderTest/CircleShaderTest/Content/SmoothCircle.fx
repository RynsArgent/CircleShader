#if OPENGL
	#define PS_SHADER ps_3_0
#else
	#define PS_SHADER ps_4_0_level_9_1
#endif

float4 PixelShaderFunction(float4 color : COLOR0, float2 uv : TEXCOORD0) : COLOR0
{
    // https://blogs.msdn.microsoft.com/shawnhar/2011/10/31/shader-aliasing/
    float2 circleCenter = float2(0.5f, 0.5f);
    float circleRadius = 0.5f;
    float distanceFromCenter = length(circleCenter - uv);
    
    float alpha = (distanceFromCenter < circleRadius) ? 1 : 0;

    return color * alpha;
}

technique Technique1
{
    pass Pass1
    {
        PixelShader = compile PS_SHADER PixelShaderFunction();
    }
}