/*
 * 描画の詳細を定義し、実際に描画する
 **/
void setup() {
  size(1350, 1080);

  background(255);
  // 座標x, yは画面の中心とする
  float cx = width / 2;
  float cy = height / 2;

  Star star = new Star(cx, cy, 50, 100);
  star.draw();
  star.rotate(HALF_PI);
  star.draw();
}
