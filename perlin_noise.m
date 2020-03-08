function [y] = perlin_noise(gradients, x) 
	lo = floor(x);
	hi = lo + 1;
	dist = x - lo;
	loSlope = gradients(mod(lo, length(gradients)) +1);
	hiSlope = gradients(mod(hi, length(gradients)) +1);
	loPos = loSlope * dist;
	hiPos = -hiSlope * (1 - dist);
	u = dist * dist * (3.0 - 2.0 * dist); % cubic curve
	y =(loPos * (1 - u)) + (hiPos * u); % interpolate
end