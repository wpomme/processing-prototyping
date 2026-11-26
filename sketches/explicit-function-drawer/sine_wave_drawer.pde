/*
 * サイン波を描画するためのクラス
 **/
class SineWaveDrawer extends FunctionDrawer {
  SineWaveDrawer(float width, float height) { super(width, height, 20, 2); }
  float funcToDraw(float x) { return sin(x); }
}
