

stepCount = 4;
stepDiamIncrease = 1;

tubeAdapter(6, 16, 9, 20);

module tubeAdapter(smallExtDiam, smallLength, bigExtDiam, bigLength) {
  difference() {
    union() {
      oneSide(bigExtDiam, bigLength);
      translate([0, 0, smallLength + bigLength]) {
        rotate([180, 0, 0]) {
        color("red")
          oneSide(smallExtDiam, smallLength);
        }
      }
    }
    translate([0, 0, -1])
      cylinder(d = smallExtDiam - 2, h=smallLength + bigLength + 2, $fn=50);
  }
}

module oneSide(diam, length) {
  stepZ = length/stepCount;
  for (step = [0 : stepCount - 1]) {
    translate([0, 0, step * stepZ]) {
      cylinder(d1 = diam, d2 = diam + stepDiamIncrease, h = stepZ, $fn=60);
    }
  }

}