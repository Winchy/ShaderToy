float metaball(vec2 p, float r)
{
    return r / dot(p, p);
}

vec3 samplef(in vec2 uv)
{
    vec2 o1 = vec2(.8, .5);
    vec2 o2 = vec2(-.5, .5);

    float r = metaball(uv -o2, .26) *
              metaball(uv - o1, .36) *
              metaball(uv - o1, .35) ;

    vec3 c = (r > .3)
              ? vec3(.5, .7, .4)
              : vec3(0., 0., 0.);

    return c;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy / iResolution.xy * 2. - 1.)
            * vec2(iResolution.x / iResolution.y, 1) * 1.25;

    vec3 col = vec3(0);
    
    col = samplef(uv);
    
    fragColor = vec4(clamp(col, 0., 1.), 1);
}