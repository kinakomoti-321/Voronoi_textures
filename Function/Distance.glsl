//----------------------------------------
//Function of Distance

//refer to https://qiita.com/7CIT/items/4126d23ffb1b28b80f27
//Euclidean Distance
#define Euclidean(p) length(p)

//Manhattan Distance 
float Manhattan2D(vec2 p){ return abs(p.x) + abs(p.y);}
float Manhattan3D(vec3 p){ return abs(p.x) + abs(p.y) + abs(p.z);}
float Manhattan4D(vec4 p){ return abs(p.x) + abs(p.y) + abs(p.z) + abs(p.w);}

//Chebyshev Distance 
float Checyshev2D(vec2 p){return max(abs(p.x),abs(p.y));}
float Checyshev3D(vec3 p){return max(max(abs(p.x),abs(p.y)),abs(p.z));}
float Checyshev4D(vec4 p){return max(max(max(abs(p.x),abs(p.y)),abs(p.z)),abs(p.w));}

//Minkowski Distance
float Minkowski2D(vec2 k,float p){vec2 k1 = pow(abs(k),vec2(p));return pow(dot(k1,vec2(1)),1.0 / p);}
float Minkowski3D(vec3 k,float p){vec3 k1 = pow(abs(k),vec3(p));return pow(dot(k1,vec3(1)),1.0 / p);}
float Minkowski4D(vec4 k,float p){vec4 k1 = pow(abs(k),vec4(p));return pow(dot(k1,vec4(1)),1.0 / p);}

//----------------------------------------
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{ 
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec3 col = vec3(0.0);
    uv *= 10.0;
    float d = floor(Minkowski2D(uv,0.3));
    col = mod(d * vec3(0.1),vec3(1.0));
    fragColor = vec4(col,0.0);
}