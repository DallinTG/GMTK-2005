#version 330

// Input vertex attributes
in vec3 vertexPosition;
in vec2 vertexTexCoord;
in vec3 vertexNormal;
in vec4 vertexColor;

// Input uniform values
uniform mat4 mvp;
uniform mat4 matModel;
uniform mat4 matNormal;

// Output vertex attributes (to fragment shader)
out vec2 fragTexCoord;
out vec4 fragColor;
out vec3 fragNormal;
out vec2 positionWS;


// NOTE: Add your custom variables here

void main()
{
    // Send vertex attributes to fragment shader

    positionWS = (matModel * vec4(vertexPosition,1)).xy;
    // positionWS = vec2(100,100);
    // positionWS = (matModel * vec4( vertexPosition, 1.0 )).xy;

    fragTexCoord = vertexTexCoord;
    fragColor = vertexColor;
    fragNormal = normalize(vec3(matNormal*vec4(vertexNormal, 1.0)));

    // Calculate final vertex position
    gl_Position = mvp*vec4(vertexPosition, 1.0);
}