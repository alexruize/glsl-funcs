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


float quadraticThroughPoint(float x, float a, float b){
	float term1 = ((1-b)/(1-a) - b/a);
	float term2 = (((1-b)/(1-a) - b/a) - b)/a;
	return term1*pow(x,2) - term2*x;
}


float safePow(float a, float b){
    // From tim.yfx in Touchdesigner's Discord (all errors mine).
	return (a<0.0 && fract(b)==0) ? sign(a) * pow(abs(a),b) : pow(a,b);
}


float doublePolynomialSigmoid(float x, int n){
	if (mod(n, 2) == 0) {
		// even exponent 
		if (x<=0.5) {
			return pow(2.0*x, 2*n)/2.0;
		} else {
			return 1.0 - safePow(2.0*(x-1.0), 2.0*n)/2.0;
		}
	} else {
		// odd exponent 
		if (x<=0.5) {
			return pow(2.0*x, 2*n+1)/2.0;
		} else {
			return 1.0 + safePow(2.0*(x-1.0), 2.0*n+1)/2.0;
		}
	} 
}


float exponentialEaseIn(float x, float a){
	return pow(x, 1.0/a);
}


float doubleExponentialSigmoid(float x, float a){
	if(x<=0.5){
		return pow(2.0*x, 1.0/a)/2.0;
	} else {
		return 1 - pow(2.0*(1.0-x), 1.0/a)/2.0;
	}
}


float logisticSigmoid(float x, float a){
	float A = 1/(1+exp(-2.0*a*(x-0.5)));
	float B = 1/(1+exp(a));
	float C = 1/(1+exp(-a));
	return (A-B)/(C-B);
}


float circularEaseOut(float x){
	return sqrt(1-pow(1-x, 2));
}


float doubleCircleSeat(float x, float a){
	if(x<=a){
		return sqrt(a*a - pow(x-a, 2));
	} else {
		return 1 - sqrt(pow(1-a, 2) - pow(x-a, 2));
	}
}


float doubleCircleSigmoid(float x, float a){
	if(x<=a){
		return a - sqrt(a*a - x*x);
	} else {
		return a + sqrt(pow(1-a, 2) - pow(x-1, 2));
	}
}

