/*
 * 放物線を描画する
 *
 * 画面を描画するピクセルと座標を相互に変換する必要がある
 * 仮に、画面幅*高さ = (800, 800)[pixel]として、それに対応する座標をそれぞれ
 * x座標: (-100, 100)、 y座標: (0, 10000)として描画する
 * y = x^2 という式から、あらかじめy座標の端点を定義しないと上手く描画できない
 **/
void setup() {
  size(800, 800);

  background(255);
  // widthの中央がx座標の0になる
  float cx = width / 2;

  // 座標の端点
  int xEdge = 100;
  int yEdge = xEdge * xEdge;

  noFill();
  beginShape();
  for (int i = 0; i < width; i++) {
    // xはピクセルから座標に変換する
    float x = map(i - cx, -cx, cx, -xEdge, xEdge);
    // yは定義通り
    float y = x * x;

    // 座標からピクセルに変換する
    float xpixel = map(x, -xEdge, xEdge, 0, width);
    // 上下方向のピクセルと座標は方向が逆
    float ypixel = map(y, 0, yEdge, height, 0);

    curveVertex(xpixel, ypixel);
  }
  endShape();
}
