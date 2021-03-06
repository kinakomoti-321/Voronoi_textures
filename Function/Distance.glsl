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
float Chebyshev2D(vec2 p){return max(abs(p.x),abs(p.y));}
float Chebyshev3D(vec3 p){return max(max(abs(p.x),abs(p.y)),abs(p.z));}
float Chebyshev4D(vec4 p){return max(max(max(abs(p.x),abs(p.y)),abs(p.z)),abs(p.w));}

//Minkowski Distance
float Minkowski2D(vec2 k,float p){vec2 k1 = pow(abs(k),vec2(p));return pow(dot(k1,vec2(1)),1.0 / p);}
float Minkowski3D(vec3 k,float p){vec3 k1 = pow(abs(k),vec3(p));return pow(dot(k1,vec3(1)),1.0 / p);}
float Minkowski4D(vec4 k,float p){vec4 k1 = pow(abs(k),vec4(p));return pow(dot(k1,vec4(1)),1.0 / p);}

//Traiangle
float Traiangle2D(vec2 p){
    p *= 0.01;
    const float k = sqrt(3.0);
    p.x = abs(p.x) - 1.0;
    p.y = p.y + 1.0/k;
    if( p.x+k*p.y>0.0 ) p = vec2(p.x-k*p.y,-k*p.x-p.y)/2.0;
    p.x -= clamp( p.x, -2.0, 0.0 );
    return -length(p)*sign(p.y) * 100.;
}
//----------------------------------------
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{ 
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec3 col = vec3(0.0);
    uv *= 10.0;
    float d = floor(Traiangle2D(uv));
    col = mod(d * vec3(0.1),vec3(1.0));
    fragColor = vec4(col,0.0);
}