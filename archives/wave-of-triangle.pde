void setup() {
  size(1350, 1080);
}

/*
 * 重心cx, cyからそれぞれ-90度、30度、120度の方向に長さRだけ線分を伸ばし、
 * その位置に座標をとって正三角形を描く
 * なお、重心からの角度をラジアンに直すと、それぞれ
 * - 1/2 * PI, 1/6 * PI, 5/6 * PIとなる
 */
void draw() {
  background(255);
  // 三角形の重心x, y
  float cx = width / 2;
  float cy = height / 2;

  // 三角形の個数
  int triangles = 50;
  // 三角形ごとの幅
  float baseGap = 20;
  // 三角形ごとの波の幅
  float phaseIncrement = 10;
  // サイン波の揺れ幅を表す
  float amplitude = 3;

  for (int i = 0; i < triangles; i++) {
    noFill();
    float gapWidth = baseGap + amplitude * sin(radians(i * phaseIncrement));
    drawRegularTriangle(cx, cy, i * gapWidth);
  }
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
