
//----------------------------------------
// Hash Function
// Hash_xD_to_yD ; input x dimention vector, output y dimention vector
// Hash_xD_to_yD_m; output -1 ~ 1

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
//----------------------------------------

//----------------------------------------
//Distance Metric

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
//Voronoi 

//reference 
//Blender sourcecode https://github.com/blender/blender/blob/594f47ecd2d5367ca936cf6fc6ec8168c2b360d0/intern/cycles/kernel/svm/svm_voronoi.h
//Blender document 

/*
Dimensions : the dimension of Voronoi Texture
- 1D
- 2D
- 3D
- 4D
*/

/*
Feature : define what ouput of Voronoi Texture to take
- F1                return color and position of and distance to nearest point
output : 

- F2                return color and position of and distance to second nearest point
output :

- Smooth F1         return smoothed output of F1
output :

- Distance to Edge  return distance to the nearest Edge of Voronoi cell
output :

- N-Sphere Radius   return  
output :

*/
/*
Distance metric : define Distance Metric in Voronoi Texture
- Euclidean
- Manhattan
- Checyshev
- Minkowski
*/

//Metric Mode
#define EUCLIDEAN 1
#define MANHATTAN 2
#define CHECYSHEV 3
#define MINKOWSKI 4

//----
//1D voronoi
//---- 

//１次元では距離の取り方は１つだけ
float voronoi_distance_1d(float a,float b,int MetricMode,float expornent){
    return abs(b - a);
}

void voronoi_f1_1d
//----------------------------------------
//Main Function
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