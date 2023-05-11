/*
	shit is a stripped back version of this shader:
	https://godotshaders.com/shader/vhs-and-crt-monitor-effect/
*/

shader_type canvas_item;

uniform float noise_opacity : hint_range(0.0, 1.0) = 0.1;
uniform float noise_speed = 5.0;
uniform float noise_intensity : hint_range(0.0, 1.0) = 0.06;

uniform float warp_amount :hint_range(0.0, 5.0) = 1.0;
uniform bool clip_warp = false;

uniform float vignette_intensity = 0.5;
uniform float vignette_opacity : hint_range(0.0, 1.0) = 1.0;

uniform sampler2D screen : hint_screen_texture;

vec2 random(vec2 uv){
    uv = vec2( dot(uv, vec2(127.1,311.7) ),
               dot(uv, vec2(269.5,183.3) ) );
    return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

float noise(vec2 uv) {
    vec2 uv_index = floor(uv);
    vec2 uv_fract = fract(uv);

    vec2 blur = smoothstep(0.0, 1.0, uv_fract);

    return mix( mix( dot( random(uv_index + vec2(0.0,0.0) ), uv_fract - vec2(0.0,0.0) ),
                     dot( random(uv_index + vec2(1.0,0.0) ), uv_fract - vec2(1.0,0.0) ), blur.x),
                mix( dot( random(uv_index + vec2(0.0,1.0) ), uv_fract - vec2(0.0,1.0) ),
                     dot( random(uv_index + vec2(1.0,1.0) ), uv_fract - vec2(1.0,1.0) ), blur.x), blur.y) * 0.5 + 0.5;
}

vec2 warp(vec2 uv){
	vec2 delta = uv - 0.5;
	float delta2 = dot(delta.xy, delta.xy);
	float delta4 = delta2 * delta2;
	float delta_offset = delta4 * warp_amount;
	
	return uv + delta * delta_offset;
}

float border (vec2 uv){
	float radius = min(warp_amount, 0.08);
	radius = max(min(min(abs(radius * 2.0), abs(1.0)), abs(1.0)), 1e-5);
	vec2 abs_uv = abs(uv * 2.0 - 1.0) - vec2(1.0, 1.0) + radius;
	float dist = length(max(vec2(0.0), abs_uv)) / radius;
	float square = smoothstep(0.96, 1.0, dist);
	return clamp(1.0 - square, 0.0, 1.0);
}

float vignette(vec2 uv){
	uv *= 1.0 - uv.xy;
	float vignette = uv.x * uv.y * 15.0;
	return pow(vignette, vignette_intensity * vignette_opacity);
}

void fragment()
{
	vec2 uv = warp(SCREEN_UV);
	float time = TIME;
	
	vec4 text = texture(screen, uv);
	text.a = 1.0;

	if (noise_intensity > 0.0)
	{
		vec2 res = 1.0 / SCREEN_PIXEL_SIZE;
		text.rgb += clamp(random((ceil(uv * res) / res) + fract(TIME)).x, 0.0, 1.0) * noise_intensity;
	}
	
	text.rgb *= border(uv);
	text.rgb *= vignette(uv);
	
	COLOR = text;
}