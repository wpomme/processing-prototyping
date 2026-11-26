void setup() {
  size(1350, 1080);

  background(255);
  // 座標x, yは画面の中心とする
  float cx = width / 2;
  float cy = height / 2;

  int aRotation = 36;
  for (int i = 0; i < aRotation * 2; i++) {
    float rad = TWO_PI - (HALF_PI / 9) * i;
    RegularTriangle triangle = new RegularTriangle(cx, cy, 100 + 10 * i);

    noFill();
    triangle.rotate(rad);
    triangle.draw();

  }
}
