
//----------------------------------------
// Hash Function
// Hash_xD_to_yD ; input x dimention vector, output y dimention vector
// Hash_xD_to_yD_m; output -1 ~ 1

float Hash_1D_to_1D(float k){
    return fract(sin(k * 104.2) * 84252.01313);
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
input: 
output : distance,cell color,cell position

- F2                return color and position of and distance to second nearest point
output : distance,cell color,cell position

- Smooth F1         return smoothed output of F1
output : distance,cell color,cell position

- Distance to Edge  return distance to the nearest Edge of Voronoi cell
output : distance

- N-Sphere Radius   return radius of the circle inscribed voronoi cell
output : radius

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

void voronoi_f1_1d(float w,float expornent,float randomness,int MetricMode, inout float outDistance,inout vec3 outColor,float outW){
    float cellPosition = floor(w);
    float localPosition = w - cellPosition;

    float minDistance = 8.0;
    float targetOffset = 0.0;
    float targetPosition = 0.0;

    //一個前のcell、今いる場所のcell、一個後のcellで距離を計算する。
    for(int i = -1; i <= 1 ; i++){
        float cellOffset = float(i);
        float pointPosition = cellOffset + Hash_1D_to_1D(cellOffset + cellPosition) * randomness;
        float distanceToPoint = voronoi_distance_1d(pointPosition,localPosition,MetricMode,expornent);

        //比較
        if(distanceToPoint < minDistance){
            targetOffset = cellOffset;
            minDistance = distanceToPoint;
            targetPosition = pointPosition;
        }
    }

    outDistance = minDistance;
    //最も近いポイントのインデックスで色を付ける
    outColor = Hash_1D_to_3D(cellPosition + targetOffset);

    outW = targetPosition + cellPosition;
}

//----
//2D voronoi
//---- 

//２次元以上は距離の取り方に種類が付けられる
float voronoi_distance_2d(vec2 a,vec2 b,int MetricMode,float expornent){
    if(MetricMode == EUCLIDEAN){
        return Euclidean(b - a);
    }
    else if(MetricMode == MANHATTAN){
        return Manhattan2D(b - a);
    }
    else if(MetricMode == CHECYSHEV){
        return Checyshev2D(b - a);
    }
    else if(MetricMode == MINKOWSKI){
        return Minkowski2D(b-a,expornent);
    }
    else{
        return 0.0;
    }
}

//F1
void voronoi_f1_2d(vec2 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec2 outPosition) {
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;
    
    float minDistance = 8.0f;
    vec2 targetOffset = vec2(0);
    vec2 targetPosition = vec2(0);    
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;
            
            float distanceToPoint = voronoi_distance_2d(pointPosition,localPosition,MetricMode,expornent);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                targetOffset = cellOffset;
                targetPosition = pointPosition;
            }
        }
    }

    outDistace = minDistance;
    outColor = Hash_2D_to_3D(cellPosition + targetOffset);
    outPosition = targetPosition + cellPosition;
}

//F2 
void voronoi_f2_2d(vec2 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec2 outPosition) {
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;

//最も近い点(F1)と二番目に近い点(F2)それぞれ判定用に用意する 
    float distF1 = 8.0f;
    float distF2 = 8.0f;

    vec2 offsetF1 = vec2(0);
    vec2 offsetF2 = vec2(0);
    vec2 positionF1 = vec2(0);
    vec2 positionF2 = vec2(0);

    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = voronoi_distance_2d(pointPosition,localPosition,MetricMode,expornent);
            
            //最近点を発見した場合
            if(distanceToPoint < distF1){
                //F1に格納される点はF2に移す
                distF2 = distF1;
                positionF2 = positionF1;
                offsetF2 = offsetF1;

                //F1の更新
                distF1 = distanceToPoint;
                positionF1 = pointPosition;
                offsetF1 = cellOffset;
            }
            //二番目に近い点を発見した場合
            else if(distanceToPoint < distF2){
                distF2 = distanceToPoint;
                positionF2 = pointPosition;
                offsetF2 = cellOffset; 
            }
        }
    }

    outDistace = distF2;
    outColor = Hash_2D_to_3D(cellPosition + offsetF2);
    outPosition = positionF2 + cellPosition;
}

//Edge

//----------------------------------------
//Main Function
vec3 texture_2D(vec2 uv){
    float dist;
    vec3 col;
    vec2 pos;
    float randomness = 1.0;
    int MetricMode = EUCLIDEAN;
    float expornent =0.3;
    voronoi_f2_2d(uv,expornent,randomness,MetricMode,dist,col,pos);
    return dist * vec3(1);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{ 
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec3 col = vec3(0.0);
    col = texture_2D(uv * 10.0); 
    fragColor = vec4(col,0.0);
}