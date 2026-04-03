shader_type canvas_item;

uniform sampler2D mask_texture :filter_nearest;
uniform vec4 color1 : source_color;
uniform vec4 color2 : source_color;
uniform vec4 color3 : source_color;
void fragment() {
	vec4 base = texture(TEXTURE, UV); //original sprite
	vec4 mask = texture(mask_texture, UV); // mask texture

vec3 final_color = base.rgb;

// Multiply original shading by chosen color
final_color = mix(final_color, color1.rgb, mask.r);
final_color = mix(final_color, color2.rgb, mask.g);
final_color = mix(final_color, color3.rgb, mask.b);

COLOR = vec4(final_color, base.a);
}