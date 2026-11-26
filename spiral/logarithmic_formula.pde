/**
 * 対数螺旋を表す計算式を実装するクラス
 */
class LogarithmicFormula implements SpiralFormula {
  Coord compute(float theta, float a, float b) {
    return new Coord(a * exp(b * theta) * cos(theta), a * exp(b * theta) * sin(theta));
  }
}
