/**
 * 螺旋を描画する
 */
void setup() {
  size(800, 800);

  background(255);
  Spiral spiral = new Spiral(width, height, 200);
  // 対数螺旋ならa = 10くらいがいい
  // Spiral spiral = new Spiral(width, height, 10);
  spiral.draw();
}
