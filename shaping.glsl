// Implemented and/or adapted from: 
// Polynomial Shaping Functions: www.flong.com/archive/texts/code/shapers_poly
// Exponential Shaping Functions: www.flong.com/archive/texts/code/shapers_exp
// Circular & Elliptical Shaping Functions: www.flong.com/archive/texts/code/shapers_circ
// Bezier and Other Parametric Shaping Functions: www.flong.com/archive/texts/code/shapers_bez
// via Book of Shaders (unless otherwise noted).
//=============================================================================================


#define PI 3.14159265358


float edgeBuild(vec2 st, float y, float d){
    // From Book of Shaders
	return smoothstep(y-d, y, st.t)-smoothstep(y, y+d, vUV.t);
}


float doubleCuebicSeat(float x, float a, float b){
	if (x<=a) {
		return b - b*pow((1-x/a), 2*n+1);
	} else {
		return b + (1-b)*pow((x-a)/(1-a),2*n+1);
	}
}
