/*
 * 自然対数関数を描画するためのクラス
 * NOTE: Xの定義域が0以上となるようにFunctionDrawerを修正する必要がある
 **/
class LogDrawer extends FunctionDrawer {
  LogDrawer(float width, float height) { super(width, height, 10, 20); }
  float funcToDraw(float x) { return log(x); }
}
