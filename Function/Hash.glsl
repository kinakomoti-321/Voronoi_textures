float Hash_1D_to_1D(float k){
    return fract(sin(k * 104.2)*84252.01313);
}
float Hash_1D_to_1D_m(float k){
    return -1.0 + 2.0 * fract(sin(k * 104.2)*84252.01313);
}

float Hash_2D_to_1D(vec2 k){
    return fract(sin(dot(k,vec2(102.3,150.1))) * 294104.3929);
}

float Hash_2D_to_1D_m(vec2 k){
    return -1.0 + 2.0 * fract(sin(dot(k,vec2(102.3,150.1))) * 294104.3929);
}

float Hash_3D_to_1D(vec3 k){
    return fract(sin(dot(k,vec3(201.0,123.0,304.2)))* 190493.02095);
}

float Hash_3D_to_1D_m(vec3 k){
    return -1.0 + 2.0 * fract(sin(dot(k,vec3(201.0,123.0,304.2)))* 190493.02095);
}

vec2 Hash_1D_to_2D(float k){
    vec2 st = vec2(k * 132.9,k * 329.0);
    return fract(sin(st) * 249402.002);
}

vec2 Hash_1D_to_2D_m(float k){
    vec2 st = vec2(k * 132.9,k * 329.0);
    return -1.0 + 2.0 * fract(sin(st) * 249402.002);
}

vec2 Hash_2D_to_2D(vec2 k){
    vec2 st = vec2(dot(k,vec2(134.4,314.0)),dot(k,vec2(932.9,141.301)));
    return fract(sin(st)*39145.295039);
}

vec2 Hash_2D_to_2D_m(vec2 k){
    vec2 st = vec2(dot(k,vec2(134.4,314.0)),dot(k,vec2(932.9,141.301)));
    return -1.0 + 2.0 * fract(sin(st)*39145.295039);
}

vec2 Hash_3D_to_2D(vec3 k){
    vec2 st = vec2(dot(k,vec3(392.0,139.0,239.0)),dot(k,vec3(193,439,290)));
    return fract(sin(st) * 924992.49);
}

vec3 Hash_1D_to_3D(float k){
   vec3 st = vec3(k * 230.0,k * 193.0,k*521.2); 
   return vec3(fract(sin(st) *12393.29));
}

vec3 Hash_2D_to_3D(vec2 k){
    vec3 st = vec3(dot(k,vec2(134.5,234.4)),dot(k,vec2(492.2,391.3)),dot(k,vec2(193.03,920.0)));
    return vec3(fract(sin(st) * 3945.2040));
}

vec3 Hash_3D_to_3D(vec3 k){
    vec3 st = vec3(dot(k,vec3(103,393,293)),dot(k,vec3(593,339,299)),dot(k,vec3(523,334,192)));
    return vec3(fract(sin(st) * 2304.2002));
}

float Hash_4D_to_1D(vec4 k){
    float st = dot(k,vec4(103,393,293,234));
    return fract(sin(st) * 20042.93);
}

vec2 Hash_4D_to_2D(vec4 k){
    vec2 st = vec2(dot(k,vec4(103,393,293,234)),dot(k,vec4(593,339,299,120)) );
    return vec2(fract(sin(st) * 23942.392));
}

vec3 Hash_4D_to_3D(vec4 k){
    vec3 st = vec3(dot(k,vec4(103,393,293,234)),dot(k,vec4(593,339,299,120)),dot(k,vec4(523,334,192,203)));
    return vec3(fract(sin(st) * 20423.12));
}
vec4 Hash_4D_to_4D(vec4 k){
    vec4 st = vec4(dot(k,vec4(103,393,293,234)),dot(k,vec4(593,339,299,120)),dot(k,vec4(523,334,192,203)),dot(k,vec4(293,391,363,103)));
    return vec4(fract(sin(st) * 2344.022));
}


vec3 texture_2D(vec2 uv){
    return Hash_2D_to_1D(uv) * vec3(1.0);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{ 
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec3 col = vec3(0.0);
    col = texture_2D(uv); 
    fragColor = vec4(col,0.0);
}