/**
 * 螺旋を描画する
 */
void setup() {
  size(800, 800);

  background(255);
  Spiral asprl = new Spiral(500, 300, 20, 10, new ArchimedeanFormula());
  Spiral lsprl = new Spiral(300, 500, 1, 1, 10, new LogarithmicFormula());
  asprl.drawPoints(50);
  lsprl.drawPoints(50);

  // save("./words/stepped-spiral-at-50-intervals.png");
}
