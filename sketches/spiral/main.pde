/**
 * 螺旋を描画する
 */
void setup() {
  size(800, 800);

  float cx = width / 2;
  float cy = height / 2;

  background(255);
  Spiral asprl = new Spiral(cx, cy, 20, 10, new ArchimedeanFormula());
  // Spiral lsprl = new Spiral(cx, cy, 1, 0.4, 20, new LogarithmicFormula());

  for (int i = 0; i < 36; i++) {
    float r = PI / 6;
    asprl.rotate(r * i);
    asprl.draw();
  }

  // save("../works/log-spirals-rotated-by-a-quarter-of-pi.png");
}
