void setup() {
  size(1350, 1080);
}

/*
 * 重心cx, cyは画面の中心とする
 */
void draw() {
  background(255);
  // 三角形の重心x, y
  float cx = width / 2;
  float cy = height / 2;

  drawStar(cx, cy, 75, 150);
}

/* 星型の図形を描画する関数
 *
 * 星型を正五角形が二つ重なったものとみなし、
 * 重心x, y,から小さい五角形の頂点への距離をr, 
 * 大きい五角形への距離をRとする
 **/
void drawStar(float cx, float cy, float r, float R) {
  beginShape();
  for (int i = 0; i < 10; i++) {
    // それぞれ-90度、30度、120度となる
    // ラジアンにすると、-1/2 * PI, 1/6 * PI, 5/6 * PIとなる
    float angle = TWO_PI / 10 * i - HALF_PI;
    if ((i % 2) == 0) {
      vertex(cx + R * cos(angle), cy + R * sin(angle));
    } else {
      vertex(cx + r * cos(angle), cy + r * sin(angle));
    }
  }
  endShape(CLOSE);
}
