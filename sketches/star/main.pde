void setup() {
  size(1350, 1080);

  background(255);

  float cx = width / 2;
  float cy = height / 2;

  int aRotation = 36;
  for (int i = 0; i < aRotation * 2; i++) {
    float rad = TWO_PI - (HALF_PI / 9) * i;
    int scale = i * 10;
    Star star = new Star(cx, cy, 50 + scale, 100 + scale);

    noFill();
    star.rotate(rad);
    star.draw();

  }

  save("../../works/scaling-star.png");
}
