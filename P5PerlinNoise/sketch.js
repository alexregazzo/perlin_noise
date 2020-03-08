let slopeAt = [];
const N = 10;
for (let i = 0; i < N; i++) {
	slopeAt[i] = (Math.random() * 2) - 1;
}

slopeAt = [4.229038e-01,
7.682837e-02,
4.917716e-02,
4.479861e-03,
-8.686550e-01,
-5.399188e-01,
-7.659194e-01,
9.795421e-01,
-8.589670e-01,
-8.799527e-01]

function setup() {
	createCanvas(windowWidth, windowHeight);
	background(0);
	stroke(255);
	let amt = 10;
	let passo = 0.001;
	for (let i = 0; i < amt; i+=passo) {
		point(map(i, 0, amt, 0, width), -samplePerlin(i) * height  + height / 2);
	}
}


function samplePerlin(x) {
	const lo = Math.floor(x);
	const hi = lo + 1;
	const dist = x - lo;
	loSlope = slopeAt[lo % N];
	hiSlope = slopeAt[hi % N];
	loPos = loSlope * dist;
	hiPos = -hiSlope * (1 - dist);
	const u = dist * dist * (3.0 - 2.0 * dist); // cubic curve
	return (loPos * (1 - u)) + (hiPos * u); // interpolate
}