/*
 * サイン波を描画する
 * 放物線の場合と違い、画面の中央が座標系の中心である
 **/
void setup() {
  size(800, 800);

  background(255);
  // widthの中央がx座標の0になる
  float cx = width / 2;

  // 座標の端点
  int xEdge = 20;
  int yEdge = 2;

  noFill();
  beginShape();
  for (int i = 0; i < width; i++) {
    // ピクセルから座標に変換
    float x = map(i - cx, -cx, cx, -xEdge, xEdge);
    float y = sin(x);

    // 座標からピクセルに変換
    float xpixel = map(x, -xEdge, xEdge, 0, width);
    float ypixel = map(y, -yEdge, yEdge, height, 0);

    curveVertex(xpixel, ypixel);
  }
  // 描画の確認のため、x軸とy軸を引く
  float cy = height / 2;

  line(0, cy, width, cy);
  line(cx, 0, cx, height);

  endShape();
}
