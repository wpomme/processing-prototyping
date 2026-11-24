/*
 * 陽関数を描画する
 **/
void setup() {
  size(800, 800);

  background(255);
  LogDrawer logDrawer = new LogDrawer(width, height);
  logDrawer.draw();
}
