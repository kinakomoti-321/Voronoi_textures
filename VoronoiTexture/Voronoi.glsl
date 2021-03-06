
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

//Blender sourcecode https://github.com/blender/blender/blob/594f47ecd2d5367ca936cf6fc6ec8168c2b360d0/intern/cycles/kernel/svm/svm_voronoi.h
//Blender document 

/*
 * Copyright 2011-2013 Blender Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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

//????????????????????????????????????????????????
float voronoi_distance_1d(float a,float b,int MetricMode,float expornent){
    return abs(b - a);
}

//F1
void voronoi_f1_1d(float w,float expornent,float randomness,int MetricMode, inout float outDistance,inout vec3 outColor,float outW){
    float cellPosition = floor(w);
    float localPosition = w - cellPosition;

    float minDistance = 8.0;
    float targetOffset = 0.0;
    float targetPosition = 0.0;

    //????????????cell?????????????????????cell???????????????cell???????????????????????????
    for(int i = -1; i <= 1 ; i++){
        float cellOffset = float(i);
        float pointPosition = cellOffset + Hash_1D_to_1D(cellOffset + cellPosition) * randomness;
        float distanceToPoint = voronoi_distance_1d(pointPosition,localPosition,MetricMode,expornent);

        //??????
        if(distanceToPoint < minDistance){
            targetOffset = cellOffset;
            minDistance = distanceToPoint;
            targetPosition = pointPosition;
        }
    }

    outDistance = minDistance;
    //???????????????????????????????????????????????????????????????
    outColor = Hash_1D_to_3D(cellPosition + targetOffset);

    outW = targetPosition + cellPosition;
}

//F2
void voronoi_f2_1d(float w,float expornent,float randomness,int MetricMode,inout float outDistance,inout vec3 outColor,inout float outW) {
    float cellPosition = floor(w);
    float localPosition = w - cellPosition;

    float offsetF1 = 0.0;
    float offsetF2= 0.0;
    float positionF1 = 0.0;
    float positionF2 = 0.0;
    float minDistF1 = 8.0;
    float minDistF2 = 8.0;

    for(int i = -1; i <= 1 ; i++){
        float cellOffset = float(i);
        float pointPosition = cellOffset + Hash_1D_to_1D(cellOffset + cellPosition) * randomness;
        float distanceToPoint = voronoi_distance_1d(pointPosition,localPosition,MetricMode,expornent);

        if(distanceToPoint < minDistF1){
           minDistF2 = minDistF1;
           offsetF2 = offsetF1;
           positionF2 = positionF1;

           minDistF1 = distanceToPoint;
           offsetF1 = cellOffset;
           positionF1 = pointPosition;
        }
        else if(distanceToPoint < minDistF2){
            minDistF2 = distanceToPoint;
            offsetF2 = cellOffset;
            positionF2 = pointPosition;
        }
    }

    outDistance = minDistF2;
    //???????????????????????????????????????????????????????????????
    outColor = Hash_1D_to_3D(cellPosition + offsetF2);

    outW = positionF2 + cellPosition;
}

//smooth f1
void voronoi_smooth_f1_1d(float w,float smoothness,float exponent,float randomness,int MetricMode,inout float outDistance,inout vec3 outColor,inout float outW){
    float cellPosition = floor(w);
    float localPosition = w - cellPosition;

    float smoothDistance = 8.0;
    vec3 smoothColor = vec3(0.0);
    float smoothW = 0.0;

    for(int i = -2; i <= 2; i++){
        float cellOffset = float(i);
        float pointPosition = cellOffset + Hash_1D_to_1D(cellOffset + cellPosition) * randomness;
        float distanceToPoint = voronoi_distance_1d(pointPosition,localPosition,MetricMode,exponent);

        float h = smoothstep(0.0,1.0,0.5 + 0.5 * (smoothDistance - distanceToPoint) / smoothness);
        float correctionFactor = smoothness * h * (1.0 - h);
        smoothDistance = mix(smoothDistance,distanceToPoint,h) - correctionFactor;

        correctionFactor /= 1.0 + 3.0 * smoothness;
        vec3 cellColor = Hash_1D_to_3D(cellPosition + cellOffset);
        smoothColor = mix(smoothColor,cellColor,h) - correctionFactor;
        smoothW = mix(smoothW,pointPosition,h) - correctionFactor;
    }

    outDistance = smoothDistance;
    outColor = smoothColor;
    outW = smoothW;
}

//edge distace
void voronoi_distance_to_edge_1d(float w,float randomness,inout float outDistace){
    float cellPosition = floor(w);
    float localPosition = w - cellPosition;

    float midPointPosition = Hash_1D_to_1D(cellPosition) * randomness;
    float leftPointPosition = -1.0 + Hash_1D_to_1D(cellPosition - 1.0) * randomness;
    float rightPointPosition = 1.0 + Hash_1D_to_1D(cellPosition + 1.0) * randomness;

    float dist_midtoleft = abs((midPointPosition + leftPointPosition) * 0.5 - localPosition);
    float dist_midtoright = abs((midPointPosition + rightPointPosition) * 0.5 - localPosition);

    outDistace = min(dist_midtoleft,dist_midtoright);
}

//sphere radius
void voronoi_n_sphere_radius_1d(float w,float randomness,inout float outDistance) {
    float cellPosition = floor(w);
    float localPosition = w - cellPosition;

    float closestPoint = 0.0;
    float closestPointOffset = 0.0;
    float minDistance = 8.0;
    //F1?????????
    for(int j = -1; j <=1; j++){
            float cellOffset = float(j);
            float pointPosition = cellOffset + Hash_1D_to_1D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(pointPosition - localPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPoint = pointPosition;
                closestPointOffset = cellOffset;
            }
    }

    //F1??????????????????????????????F1??????????????????????????????????????????
    minDistance = 8.0;
    float closestPointToClosestPoint = 0.0;
    for(int j = -1; j <=1; j++){
            if(j == 0){
                continue;
            }
            //Offset???F1?????????????????????????????????
            float cellOffset = float(j) + closestPointOffset;
            float pointPosition = cellOffset + Hash_1D_to_1D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(closestPoint - pointPosition);

            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPointToClosestPoint = pointPosition;
            }
    }

    //F1???????????????????????????????????????????????????????????????????????????????????????
    outDistance = length(closestPointToClosestPoint - closestPoint) * 0.5;
}

//----
//2D voronoi
//---- 

//???????????????????????????????????????????????????????????????
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

//???????????????(F1)????????????????????????(F2)???????????????????????????????????? 
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
            
            //??????????????????????????????
            if(distanceToPoint < distF1){
                //F1????????????????????????F2?????????
                distF2 = distF1;
                positionF2 = positionF1;
                offsetF2 = offsetF1;

                //F1?????????
                distF1 = distanceToPoint;
                positionF1 = pointPosition;
                offsetF1 = cellOffset;
            }
            //??????????????????????????????????????????
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

//Distance to Edge
//refer to https://www.iquilezles.org/www/articles/voronoilines/voronoilines.htm
void voronoi_distance_to_edge_2d(vec2 coord,float randomness,inout float outDistance) {
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;
    //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? 
    //F1???????????? 
    float minDistance = 8.0f;
    vec2 pointF1 = vec2(0.0);
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            vec2 cellOffset = vec2(i,j);
            //localPosition???????????????coord????????????????????????????????????????????????????????????????????????????????????
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness - localPosition;

            //sqrt???????????????dot?????????             
            float distanceToPoint = dot(pointPosition,pointPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                pointF1 = pointPosition;
            }
        }
    }

    //F1??????????????????????????????????????????????????????????????????
    minDistance = 8.0;
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness - localPosition;
            vec2 perpendicularToEdge = pointPosition - pointF1;
            //F1???F1?????????????????????????????????
            if(dot(perpendicularToEdge,perpendicularToEdge) > 0.001){
                //F1????????????????????????P???????????????????????????F1,P?????????????????????????????????????????????????????????????????????????????????
                //???????????????????????? ????????????????????????
                float distanceToEdge = dot((pointF1 + pointPosition) / 2.0 , normalize(perpendicularToEdge));
                minDistance = min(minDistance,distanceToEdge);
            }
        }
    }
    outDistance = minDistance;
}

//smooth F1
void voronoi_smooth_f1_2d(vec2 coord,float smoothness,float exponent,float randomness,int MetricMode,inout float outDistance,inout vec3 outColor,inout vec2 outPosition){
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;

    float smoothDistance = 8.0f;
    vec3 smoothColor = vec3(0.0);
    vec2 smoothPosition = vec2(0.0);
    //?????????????????????????????????smoothness???????????????????????????????????????????????????????????????????????????????????????
    for(int j = -2; j <=2; j++){
        for(int i = -2; i <=2; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;

            float distanceToPoint = voronoi_distance_2d(pointPosition,localPosition,MetricMode,exponent);
            
            //Polynomial Smooth minimum
            //https://wiki.blender.org/wiki/User:OmarSquircleArt/GSoC2019/Documentation/Smooth_Voronoi
            float h = smoothstep(0.0f,1.0f,0.5f + 0.5f * (smoothDistance - distanceToPoint) / smoothness);
            float correctionFactor = smoothness * h * (1.0 - h);
            smoothDistance = mix(smoothDistance,distanceToPoint,h) - correctionFactor;

            //??????????????????????????????????????????????????????????????????????????????????????????????????????correctionFactor??????????????????????????????
            correctionFactor /= 1.0f + 3.0f * smoothness;
            vec3 cellColor = Hash_2D_to_3D(cellPosition + cellOffset);
            smoothColor = mix(smoothColor,cellColor,h) - correctionFactor;
            smoothPosition = mix(smoothPosition,pointPosition,h) - correctionFactor;
        }
    }
    outDistance = smoothDistance;
    outPosition = cellPosition + smoothPosition;
    outColor = smoothColor;
}

// sphere_radius
void voronoi_n_sphere_radius_2d(vec2 coord,float randomness,inout float outDistance) {
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;

    vec2 closestPoint = vec2(0.0);
    vec2 closestPointOffset = vec2(0.0);
    float minDistance = 8.0;
    //F1?????????
    for(int j = -1; j <=1; j++){
        for(int i = -1; i <= 1; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(pointPosition - localPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPoint = pointPosition;
                closestPointOffset = cellOffset;
            }
        }
    }

    //F1??????????????????????????????F1??????????????????????????????????????????
    minDistance = 8.0;
    vec2 closestPointToClosestPoint = vec2(0.0);
    for(int j = -1; j <=1; j++){
        for(int i = -1; i <= 1; i++){
            //?????????????????????????????????
            if(i == 0 && j == 0){
                continue;
            }
            //Offset???F1?????????????????????????????????
            vec2 cellOffset = vec2(i,j) + closestPointOffset;
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(closestPoint - pointPosition);

            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPointToClosestPoint = pointPosition;
            }
        }
    }

    //F1???????????????????????????????????????????????????????????????????????????????????????
    outDistance = length(closestPointToClosestPoint - closestPoint) * 0.5;
}

//----
//3D Voronoi
//----

float voronoi_distance_3d(vec3 a,vec3 b,int MetricMode,float expornent){
    if(MetricMode == EUCLIDEAN){
        return Euclidean(b - a);
    }
    else if(MetricMode == MANHATTAN){
        return Manhattan3D(b - a);
    }
    else if(MetricMode == CHECYSHEV){
        return Checyshev3D(b - a);
    }
    else if(MetricMode == MINKOWSKI){
        return Minkowski3D(b-a,expornent);
    }
    else{
        return 0.0;
    }
}


//F1
void voronoi_f1_3d(vec3 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec3 outPosition) {
    vec3 cellPosition = floor(coord);
    vec3 localPosition = coord - cellPosition;
    
    float minDistance = 8.0f;
    vec3 targetOffset = vec3(0);
    vec3 targetPosition = vec3(0);    
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k<=1; k++){
            vec3 cellOffset = vec3(i,j,k);
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness;
            
            float distanceToPoint = voronoi_distance_3d(pointPosition,localPosition,MetricMode,expornent);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                targetOffset = cellOffset;
                targetPosition = pointPosition;
            }
            }
        }
    }

    outDistace = minDistance;
    outColor = Hash_3D_to_3D(cellPosition + targetOffset);
    outPosition = targetPosition + cellPosition;
}

//F2
void voronoi_f2_3d(vec3 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec3 outPosition) {
    vec3 cellPosition = floor(coord);
    vec3 localPosition = coord - cellPosition;

    float distF1 = 8.0f;
    float distF2 = 8.0f;

    vec3 offsetF1 = vec3(0);
    vec3 offsetF2 = vec3(0);
    vec3 positionF1 = vec3(0);
    vec3 positionF2 = vec3(0);

    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k <=1; k++){
            vec3 cellOffset = vec3(i,j,k);
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = voronoi_distance_3d(pointPosition,localPosition,MetricMode,expornent);
            
            if(distanceToPoint < distF1){
                distF2 = distF1;
                positionF2 = positionF1;
                offsetF2 = offsetF1;

                distF1 = distanceToPoint;
                positionF1 = pointPosition;
                offsetF1 = cellOffset;
            }
            else if(distanceToPoint < distF2){
                distF2 = distanceToPoint;
                positionF2 = pointPosition;
                offsetF2 = cellOffset; 
            }
            }
        }
    }

    outDistace = distF2;
    outColor = Hash_3D_to_3D(cellPosition + offsetF2);
    outPosition = positionF2 + cellPosition;
}

//distance edge
void voronoi_distance_to_edge_3d(vec3 coord,float randomness,inout float outDistance) {
    vec3 cellPosition = floor(coord);
    vec3 localPosition = coord - cellPosition;

    float minDistance = 8.0f;
    vec3 pointF1 = vec3(0.0);
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k <=1; k++){
            vec3 cellOffset = vec3(i,j,k);
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness - localPosition;

            float distanceToPoint = dot(pointPosition,pointPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                pointF1 = pointPosition;
            }
            }
        }
    }

    minDistance = 8.0;
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k <=1;k++){
            vec3 cellOffset = vec3(i,j,k);
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness - localPosition;
            vec3 perpendicularToEdge = pointPosition - pointF1;
            if(dot(perpendicularToEdge,perpendicularToEdge) > 0.001){
                float distanceToEdge = dot((pointF1 + pointPosition) / 2.0 , normalize(perpendicularToEdge));
                minDistance = min(minDistance,distanceToEdge);
            }
            }
        }
    }
    outDistance = minDistance;
}

//smooth f1
void voronoi_smooth_f1_3d(vec3 coord,float smoothness,float exponent,float randomness,int MetricMode,inout float outDistance,inout vec3 outColor,inout vec3 outPosition){
    vec3 cellPosition = floor(coord);
    vec3 localPosition = coord - cellPosition;

    float smoothDistance = 8.0f;
    vec3 smoothColor = vec3(0.0);
    vec3 smoothPosition = vec3(0.0);
    for(int j = -2; j <=2; j++){
        for(int i = -2; i <=2; i++){
            for(int k = -2; k<=2; k++){
            vec3 cellOffset = vec3(i,j,k);
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness;

            float distanceToPoint = voronoi_distance_3d(pointPosition,localPosition,MetricMode,exponent);
            
            float h = smoothstep(0.0f,1.0f,0.5f + 0.5f * (smoothDistance - distanceToPoint) / smoothness);
            float correctionFactor = smoothness * h * (1.0 - h);
            smoothDistance = mix(smoothDistance,distanceToPoint,h) - correctionFactor;

            correctionFactor /= 1.0f + 3.0f * smoothness;
            vec3 cellColor = Hash_3D_to_3D(cellPosition + cellOffset);
            smoothColor = mix(smoothColor,cellColor,h) - correctionFactor;
            smoothPosition = mix(smoothPosition,pointPosition,h) - correctionFactor;
            }
        }
    }
    outDistance = smoothDistance;
    outPosition = cellPosition + smoothPosition;
    outColor = smoothColor;
}

// sphere_radius
void voronoi_n_sphere_radius_3d(vec3 coord,float randomness,inout float outDistance) {
    vec3 cellPosition = floor(coord);
    vec3 localPosition = coord - cellPosition;

    vec3 closestPoint = vec3(0.0);
    vec3 closestPointOffset = vec3(0.0);
    float minDistance = 8.0;

    for(int j = -1; j <=1; j++){
        for(int i = -1; i <= 1; i++){
            for(int k = -1; k <= 1; k++){
            vec3 cellOffset = vec3(i,j,k);
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(pointPosition - localPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPoint = pointPosition;
                closestPointOffset = cellOffset;
            }
            }
        }
    }

    minDistance = 8.0;
    vec3 closestPointToClosestPoint = vec3(0.0);

    for(int j = -1; j <=1; j++){
        for(int i = -1; i <= 1; i++){
            for(int k = -1; k <= 1; k++){
            if(i == 0 && j == 0 && k == 0){
                continue;
            }
            vec3 cellOffset = vec3(i,j,k) + closestPointOffset;
            vec3 pointPosition = cellOffset + Hash_3D_to_3D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(closestPoint - pointPosition);

            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPointToClosestPoint = pointPosition;
            }
            }
        }
    }

    outDistance = length(closestPointToClosestPoint - closestPoint) * 0.5;
}

//----
//4D Voronoi
//----

float voronoi_distance_4d(vec4 a,vec4 b,int MetricMode,float expornent){
    if(MetricMode == EUCLIDEAN){
        return Euclidean(b - a);
    }
    else if(MetricMode == MANHATTAN){
        return Manhattan4D(b - a);
    }
    else if(MetricMode == CHECYSHEV){
        return Checyshev4D(b - a);
    }
    else if(MetricMode == MINKOWSKI){
        return Minkowski4D(b-a,expornent);
    }
    else{
        return 0.0;
    }
}


//F1
void voronoi_f1_4d(vec4 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec4 outPosition) {
    vec4 cellPosition = floor(coord);
    vec4 localPosition = coord - cellPosition;
    
    float minDistance = 8.0f;
    vec4 targetOffset = vec4(0);
    vec4 targetPosition = vec4(0);    
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k<=1; k++){
                for(int w = -1; w <= 1; w++){
            vec4 cellOffset = vec4(i,j,k,w);
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = voronoi_distance_4d(pointPosition,localPosition,MetricMode,expornent);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                targetOffset = cellOffset;
                targetPosition = pointPosition;
            }
                }
            }
        }
    }

    outDistace = minDistance;
    outColor = Hash_4D_to_3D(cellPosition + targetOffset);
    outPosition = targetPosition + cellPosition;
}

//F2
void voronoi_f2_3d(vec4 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec4 outPosition) {
    vec4 cellPosition = floor(coord);
    vec4 localPosition = coord - cellPosition;

//???????????????(F1)????????????????????????(F2)???????????????????????????????????? 
    float distF1 = 8.0f;
    float distF2 = 8.0f;

    vec4 offsetF1 = vec4(0);
    vec4 offsetF2 = vec4(0);
    vec4 positionF1 = vec4(0);
    vec4 positionF2 = vec4(0);

    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k <=1; k++){
                for(int w = -1; w <= 1; w++){
            vec4 cellOffset = vec4(i,j,k,w);
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = voronoi_distance_4d(pointPosition,localPosition,MetricMode,expornent);
            
            //??????????????????????????????
            if(distanceToPoint < distF1){
                //F1????????????????????????F2?????????
                distF2 = distF1;
                positionF2 = positionF1;
                offsetF2 = offsetF1;

                //F1?????????
                distF1 = distanceToPoint;
                positionF1 = pointPosition;
                offsetF1 = cellOffset;
            }
            //??????????????????????????????????????????
            else if(distanceToPoint < distF2){
                distF2 = distanceToPoint;
                positionF2 = pointPosition;
                offsetF2 = cellOffset; 
            }
                }
            }
        }
    }

    outDistace = distF2;
    outColor = Hash_4D_to_3D(cellPosition + offsetF2);
    outPosition = positionF2 + cellPosition;
}

//distance edge
void voronoi_distance_to_edge_4d(vec4 coord,float randomness,inout float outDistance) {
    vec4 cellPosition = floor(coord);
    vec4 localPosition = coord - cellPosition;

    float minDistance = 8.0f;
    vec4 pointF1 = vec4(0.0);
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k <=1; k++){
                for(int w = -1; w <= 1; w++){
            vec4 cellOffset = vec4(i,j,k,w);
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness - localPosition;

            float distanceToPoint = dot(pointPosition,pointPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                pointF1 = pointPosition;
            }
                }
            }
        }
    }

    minDistance = 8.0;
    for(int j = -1; j <= 1; j++){
        for(int i = -1; i<=1; i++){
            for(int k = -1; k <=1;k++){
                for(int w = -1; w <= 1; w++){
            vec4 cellOffset = vec4(i,j,k,w);
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness - localPosition;
            vec4 perpendicularToEdge = pointPosition - pointF1;
            if(dot(perpendicularToEdge,perpendicularToEdge) > 0.001){
                float distanceToEdge = dot((pointF1 + pointPosition) / 2.0 , normalize(perpendicularToEdge));
                minDistance = min(minDistance,distanceToEdge);
            }
                }
            }
        }
    }
    outDistance = minDistance;
}

//smooth f1
void voronoi_smooth_f1_4d(vec4 coord,float smoothness,float exponent,float randomness,int MetricMode,inout float outDistance,inout vec3 outColor,inout vec4 outPosition){
    vec4 cellPosition = floor(coord);
    vec4 localPosition = coord - cellPosition;

    float smoothDistance = 8.0f;
    vec3 smoothColor = vec3(0.0);
    vec4 smoothPosition = vec4(0.0);
    for(int j = -2; j <=2; j++){
        for(int i = -2; i <=2; i++){
            for(int k = -2; k<=2; k++){
                for(int w = -2; w <= 2; w++){
            vec4 cellOffset = vec4(i,j,k,w);
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness;

            float distanceToPoint = voronoi_distance_4d(pointPosition,localPosition,MetricMode,exponent);
            
            float h = smoothstep(0.0f,1.0f,0.5f + 0.5f * (smoothDistance - distanceToPoint) / smoothness);
            float correctionFactor = smoothness * h * (1.0 - h);
            smoothDistance = mix(smoothDistance,distanceToPoint,h) - correctionFactor;

            correctionFactor /= 1.0f + 3.0f * smoothness;
            vec3 cellColor = Hash_4D_to_3D(cellPosition + cellOffset);
            smoothColor = mix(smoothColor,cellColor,h) - correctionFactor;
            smoothPosition = mix(smoothPosition,pointPosition,h) - correctionFactor;
            }
            }
        }
    }
    outDistance = smoothDistance;
    outPosition = cellPosition + smoothPosition;
    outColor = smoothColor;
}

void voronoi_n_sphere_radius_4d(vec4 coord,float randomness,inout float outDistance) {
    vec4 cellPosition = floor(coord);
    vec4 localPosition = coord - cellPosition;

    vec4 closestPoint = vec4(0.0);
    vec4 closestPointOffset = vec4(0.0);
    float minDistance = 8.0;
    //F1?????????
    for(int j = -1; j <=1; j++){
        for(int i = -1; i <= 1; i++){
            for(int k = -1; k <= 1; k++){
                for(int w = -1; w <= 1; w++){
            vec4 cellOffset = vec4(i,j,k,w);
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(pointPosition - localPosition);
            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPoint = pointPosition;
                closestPointOffset = cellOffset;
            }
                }
            }
        }
    }

    minDistance = 8.0;
    vec4 closestPointToClosestPoint = vec4(0.0);

    for(int j = -1; j <=1; j++){
        for(int i = -1; i <= 1; i++){
            for(int k = -1; k <= 1; k++){
                for(int w = -1; w <= 1; w++){
            if(i == 0 && j == 0 && k == 0 && w == 0){
                continue;
            }
            vec4 cellOffset = vec4(i,j,k,w) + closestPointOffset;
            vec4 pointPosition = cellOffset + Hash_4D_to_4D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = length(closestPoint - pointPosition);

            if(distanceToPoint < minDistance){
                minDistance = distanceToPoint;
                closestPointToClosestPoint = pointPosition;
            }
                }
            }
        }
    }

    outDistance = length(closestPointToClosestPoint - closestPoint) * 0.5;
}

//----------------------------------------
//Crackle
//----------------------------------------

//Refference
//https://github.com/blender/blender/blob/594f47ecd2d5367ca936cf6fc6ec8168c2b360d0/source/blender/blenlib/intern/noise.c

float voronoi_Crackle_2d(vec2 uv,int MetricMode,float exponent,float randomness,float scale){
    float F1;
    float F2;
    vec3 col;
    vec2 pos;
    voronoi_f1_2d(uv,exponent,randomness,MetricMode,F1,col,pos);
    voronoi_f2_2d(uv,exponent,randomness,MetricMode,F2,col,pos);

    return clamp((F2 - F1)*scale,0.0,1.0);
}

//----------------------------------------
//Weight Voronoi
//----------------------------------------

void voronoi_weight_f1_2d(vec2 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec2 outPosition,float weight) {
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;
    
    float minDistance = 8.0f;
    vec2 targetOffset = vec2(0);
    vec2 targetPosition = vec2(0);    
    for(int j = -2; j <= 2; j++){
        for(int i = -2; i<=2; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;
            
            float distanceToPoint = voronoi_distance_2d(pointPosition,localPosition,MetricMode,expornent) - Hash_2D_to_1D(cellPosition + cellOffset) * weight;
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
void voronoi_weight_f2_2d(vec2 coord,float expornent,float randomness,int MetricMode,inout float outDistace,inout vec3 outColor,inout vec2 outPosition,float weight) {
    vec2 cellPosition = floor(coord);
    vec2 localPosition = coord - cellPosition;

    float distF1 = 8.0f;
    float distF2 = 8.0f;

    vec2 offsetF1 = vec2(0);
    vec2 offsetF2 = vec2(0);
    vec2 positionF1 = vec2(0);
    vec2 positionF2 = vec2(0);

    for(int j = -2; j <= 2; j++){
        for(int i = -2; i<=2; i++){
            vec2 cellOffset = vec2(i,j);
            vec2 pointPosition = cellOffset + Hash_2D_to_2D(cellPosition + cellOffset) * randomness;
            float distanceToPoint = voronoi_distance_2d(pointPosition,localPosition,MetricMode,expornent) - Hash_2D_to_1D(cellPosition + cellOffset) * weight;
            
            if(distanceToPoint < distF1){
                distF2 = distF1;
                positionF2 = positionF1;
                offsetF2 = offsetF1;

                distF1 = distanceToPoint;
                positionF1 = pointPosition;
                offsetF1 = cellOffset;
            }
            //??????????????????????????????????????????
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

float voronoi_weight_Crackle_2d(vec2 uv,int MetricMode,float exponent,float randomness,float scale,float weight){
    float F1;
    float F2;
    vec3 col;
    vec2 pos;
    voronoi_weight_f1_2d(uv,exponent,randomness,MetricMode,F1,col,pos,weight);
    voronoi_weight_f2_2d(uv,exponent,randomness,MetricMode,F2,col,pos,weight);

    return clamp((F2 - F1)*scale,0.0,1.0);
}
//
//----------------------------------------
//Main Function
vec3 texture_2D(vec2 uv){
    float dist;
    vec3 col;
    vec2 pos;
    float randomness = 1.0;
    int MetricMode = EUCLIDEAN;
    float exponent =0.3;
    float smoothness = 0.1;

    voronoi_weight_f1_2d(uv,exponent,randomness,MetricMode,dist,col,pos,0.8);

    return vec3(dist);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{ 
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec3 col = vec3(0.0);
    col = texture_2D(uv * 5.0); 
    fragColor = vec4(col,0.0);
}