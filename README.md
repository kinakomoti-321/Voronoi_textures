# Voronoi_textures
GLSL_VoronoiTexture

The Voronoi texture in this source code is a GLSL rewrite of Blender's "sbm_voronoi.h".
    
This GLSL code is designed to be run on ShaderToy. However, because voronoi program and Hash, Distance Metric use only general GLSL function, These programs can be worked in environments other than ShaderToy.

If you want Voronoi.glsl to work, you need to copy and paste it to code editor in ShaderToy, or install ShaderToy VScode extension and run it in VScode.


[Blender / svm_voronoi.h](https://github.com/blender/blender/blob/594f47ecd2d5367ca936cf6fc6ec8168c2b360d0/intern/cycles/kernel/svm/svm_voronoi.h) 

# Gallery
#### F1
![F1_Euclid](/Pictures/F1_Euclid.png)

![F1_Euclid_Color](/Pictures/F1_Euclid_Color.png)

#### F1 Manhattan
![F1_Manhattan](/Pictures/F1__Manhattan.png)

#### F1 smooth
![F1_smooth1](/Pictures/F1_smooth1.png)

#### edge_distance
![F1_edge_distace](/Pictures/F1_edge_distance.png)

# Referecne
- [符号なし距離関数で作る色々なボロノイ](https://qiita.com/7CIT/items/4126d23ffb1b28b80f27) @7CIT
- [Smooth Voronoi PDF](https://wiki.blender.org/wiki/User:OmarSquircleArt/GSoC2019/Documentation/Smooth_Voronoi) Blender Documentation
- [Blender / svm_voronoi.h](https://github.com/blender/blender/blob/594f47ecd2d5367ca936cf6fc6ec8168c2b360d0/intern/cycles/kernel/svm/svm_voronoi.h) Blender SourceCode
- [Voronoi Texture Node](https://docs.blender.org/manual/ja/2.90/render/shader_nodes/textures/voronoi.html) Blender Manual
- [voronoi edges](https://www.iquilezles.org/www/articles/voronoilines/voronoilines.htm) Inigo Quilez
