/**
 * 螺旋を描画するクラス
 * 引数: x, y座標とパラメーターa, b、螺旋の回転数revs, 螺旋の計算式formula
 * 螺旋の計算式がアルキメデスの螺旋の場合は、パラメーターは一つだけ必要
 * 螺旋の計算式が対数螺旋の場合は、パラメーターa, bの二つが必要
 */
class Spiral {
  int DEGREE = 360;
  float cx, cy, a, b;
  int revs, totalSteps;
  SpiralFormula formula;
  Pixel[] pixels;

  // アルキメデスの螺旋
  Spiral(float cx, float cy, float b, int revs, SpiralFormula formula) {
    this.cx = cx;
    this.cy = cy;
    this.b = b;
    this.revs = revs;
    this.totalSteps = DEGREE * revs;
    this.formula = formula;

    this.pixels = _plot();
  }

  // 対数螺旋
  Spiral(float cx, float cy, float a, float b, int revs, SpiralFormula formula) {
    this.cx = cx;
    this.cy = cy;
    this.a = a;
    this.b = b;
    this.revs = revs;
    this.totalSteps = DEGREE * revs;
    this.formula = formula;

    this.pixels = _plot();
  }

  void draw() {
    _draw(pixels);
  }

  // ピクセルと描画するという振る舞いを分離させる
  void _draw(Pixel[] pixels) {
    noFill();
    beginShape();

    for (int i = 0; i < totalSteps; i++) {
      curveVertex(pixels[i].x, pixels[i].y);
    }

    endShape();
  }

  // 一定の間隔ごとに螺旋の奇跡を点として描画する
  void drawPoints(int interval) {
    noFill();
    beginShape();

    for (int i = 0; i < totalSteps; i = i + interval) {
      vertex(pixels[i].x, pixels[i].y);
    }

    endShape();
  }

  void rotate(float rad) {
    _rotate(rad, pixels);
  }

  void _rotate(float rad, Pixel[] pixels) {
    for (int i = 0; i < totalSteps; i++) {
      float dx = pixels[i].x - cx;
      float dy = pixels[i].y - cy;
      float rx = cx + dx * cos(rad) - dy * sin(rad);
      float ry = cy + dx * sin(rad) + dy * cos(rad);
      pixels[i] = new Pixel(rx, ry);
    }
  }

  // 螺旋の計算式から描画するピクセルの位置を求める
  Pixel[] _plot() {
    Coord[] coords = _coords(new Coord[totalSteps]);
    return _pixels(new Pixel[totalSteps], coords);
  }

  // 計算式から座標系を作成する
  Coord[] _coords(Coord[] coords) {
    for (int i = 0; i < totalSteps; i++) {
      float theta = radians(i);

      coords[i] = formula.compute(theta, a, b);
    }

    return coords;
  }

  // 座標系からピクセルの配列を求める
  Pixel[] _pixels(Pixel[] pixels, Coord[] coords) {
    for (int i = 0; i < totalSteps; i++) {
      pixels[i] = _pixel(coords[i]);
    }

    return pixels;
  }

  // 座標からピクセルへ変換する
  Pixel _pixel(Coord c) {
    return new Pixel(map(c.x, -b, b, cx - b, cx + b), map(c.y, -b, b, cy + b, cy - b));
  }
}
