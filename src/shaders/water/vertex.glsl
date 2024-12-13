uniform float uTime;
uniform float uBigWavesElevation;
uniform vec2 uBigWavesFrequency;
uniform float uBigWavesSpeed;


void main(){
 vec4 modelPosition = modelMatrix * vec4(position,1.0);

//  Elevation
 float eleveation = sin(modelPosition.x * uBigWavesFrequency.y+uTime*uBigWavesSpeed)*
                    sin(modelPosition.z * uBigWavesFrequency.y + uTime*uBigWavesSpeed)* 
                    uBigWavesElevation;

modelPosition.y += eleveation;

 vec4 viewPosition = viewMatrix * modelPosition;
 vec4 projectionPosition = projectionMatrix * viewPosition;





    gl_Position = projectionPosition;
}