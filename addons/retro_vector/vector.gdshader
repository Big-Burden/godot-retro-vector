shader_type spatial;
render_mode unshaded, blend_add, depth_draw_always;

uniform float min_fade_distance = 100.0f;
uniform float wobble_scale = 1;
uniform float wobble_speed = 100.0f;

uniform bool use_vertex_colour = true;
 
uniform vec4 colour : source_color = vec4(0,1,0,1);

vec3 rand_v(vec2 uv)
{
    uv = fract(uv);
    const float pi = 3.1415927;
    uv.y = uv.y * 2.0 - 1.0;
    return vec3(sqrt(max(0.0, 1.0 - uv.y * uv.y)) * sin(vec2(0.5 * pi, 0) + uv.x * 2.0 * pi), uv.y);
}

void vertex()
{
	if(!use_vertex_colour)
	{
		COLOR.rgb = colour.rgb;
	}
	
	vec3 rand_offset = rand_v(VERTEX.xz * (TIME * wobble_speed)) * 0.01;
	VERTEX += rand_offset * wobble_scale;
	VERTEX *= 1.005;

}

void fragment()
{
	ALBEDO = vec3(COLOR.r,COLOR.g,COLOR.b);
	ALPHA = colour.a;
	
	if(min_fade_distance != 0.0)
	{
		ALPHA *= clamp(smoothstep(min_fade_distance, 0, -VERTEX.z), 0.0, 1.0);
	}
}