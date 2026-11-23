void setup() {
  size(1350, 1080);
}

/* 正三角形を描画する関数
/* 重心x, y, そして重心から三点への距離Rを引数としてとる
 **/
void drawRegularTriangle(float cx, float cy, float R) {
  beginShape();
  for (int i = 0; i < 3; i++) {
    // それぞれ-90度、30度、120度となる
    // ラジアンにすると、-1/2 * PI, 1/6 * PI, 5/6 * PIとなる
    float angle = TWO_PI / 3 * i - HALF_PI;
    vertex(cx + R * cos(angle), cy + R * sin(angle));
  }
  endShape(CLOSE);
}
