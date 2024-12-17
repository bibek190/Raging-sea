uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uColorOffset;
uniform float uColorMultiplier;


varying float vElevation;
// fog
uniform vec3 fogColor;
uniform float fogNear;
uniform float fogFar;

varying float vFogDepth;

void main(){
   

    float mixStrength = (vElevation + uColorOffset) * uColorMultiplier;
    vec3 color = mix(uDepthColor,uSurfaceColor,mixStrength);

    // fog
    float fogFactor = smoothstep(fogNear, fogFar, vFogDepth);
    vec3 finalColor = mix(color,fogColor,fogFactor);

    // Blend edge color with transparency
    gl_FragColor = vec4(finalColor,1.0);

}