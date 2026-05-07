shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;
uniform float shake_subtle : hint_range(0.0, 10.0) = 1.0;
uniform float grain_amount : hint_range(0.0, 0.1) = 0.03;
uniform float distortion_size : hint_range(0.1, 10.0) = 1.0;

float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = SCREEN_UV;
    
    // 1. Distorsión de línea horizontal (ligera y Low Poly)
    float wave = sin(TIME * 2.0 + uv.y * 15.0 * distortion_size) * 0.001 * shake_subtle;
    uv.x += wave;
    
    // 2. Aberración cromática ultra simple (solo 2 muestras)
    vec4 color;
    color.r = texture(SCREEN_TEXTURE, uv + vec2(0.001, 0.0)).r;
    color.g = texture(SCREEN_TEXTURE, uv).g;
    color.b = texture(SCREEN_TEXTURE, uv - vec2(0.001, 0.0)).b;
    color.a = texture(SCREEN_TEXTURE, uv).a;
    
    // 3. Grano de película ligero
    float noise = (rand(uv + TIME) - 0.5) * grain_amount;
    color.rgb += noise;
    
    // 4. Líneas de escaneo (Scanlines) estáticas
    float scanline = sin(uv.y * 400.0) * 0.04;
    color.rgb -= scanline;

    COLOR = color;
}
