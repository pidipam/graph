Shader "Graph/Point Surface" 
{
    Properties
    {
        _Smoothness ("Smoothness", Range(0,1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface ConfigureSurface Standard fullforwardshadows
        #pragma target 3.0

        struct Input
        {
            float3 worldPos;
        };

        float _Smoothness;
        void ConfigureSurface (Input input, inout SurfaceOutputStandard surface)
        {
            surface.Albedo = saturate(input.worldPos * 0.5 + 0.5); // supaya range -1 - 1 jadi 0 - 1
            surface.Smoothness = _Smoothness; // change the material from matte to look more shiny
        }
        ENDCG
    }
    Fallback "Diffuse"
}