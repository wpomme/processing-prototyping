/*
 * 図形に必要なメソッドや変数を定義するためのインターフェイス
 **/
interface Shape {
  // 図形を描画する
  void draw();
  // 図形の拡大縮小を行う
  void scale(float n);
  // コンストラクターで与えられた値を中心点として図形を回転させる
  void rotate(float rad);
}
