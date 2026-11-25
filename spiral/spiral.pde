/**
 * 螺旋を描画するクラス
 * 画面の中央が座標の中心
 * 引数として、画面の幅と高さとパラメーターrを取る
 * 対数螺旋の場合は、さらにもう一つのパラメーターbが必要
 */
class Spiral {
  float width, height, cx, cy, r;

  Spiral(float width, float height, float r) {
    this.width = width;
    this.height = height;

    this.cx = width / 2;
    this.cy = height / 2;
    this.r = r;
  }

  void draw() {
    float cx = this.cx;
    float cy = this.cy;
    float r = this.r;

    noFill();
    beginShape();

    for (int i = 0; i < 360; i++) {
      // アルキメデスの螺旋
      float theta = radians(i);
      float x = r * theta * cos(theta);
      float y = r * theta * sin(theta);
      // 対数螺旋
      // float b = this.b;
      // float x = r * exp(b * theta) * cos(theta);
      // float y = r * exp(b * theta) * sin(theta);

      // 座標からピクセルに変換
      float xpixel = map(x, -r, r, cx - r, cx + r);
      float ypixel = map(y, -r, r, cy + r, cy - r);

      curveVertex(xpixel, ypixel);
    }

    line(0, cy, this.width, cy);
    line(cx, 0, cx, this.height);

    endShape();
  }
}

