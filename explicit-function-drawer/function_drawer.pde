/*
 * 陽関数を描画するための親クラス
 * 画面の中央が座標の中心となる
 * 引数として、画面の幅と高さの他にX軸とY軸の端点を取る
 * X軸とY軸の端点は、描画する関数の値から決める必要がある
 * また、funcToDrawメソッドでは、Template Methodパターンを使っている
 * 子クラスでfuncToDrawをオーバーライドして、Y軸に関数を適用する
 * 無名関数が使えれば、そちらに置き換えた方がいい
 **/
class FunctionDrawer {
  float width, height, cx, cy, xEdge, yEdge;

  FunctionDrawer(float width, float height, float xEdge, float yEdge) {
    this.width = width;
    this.height = height;

    this.cx = width / 2;
    this.cy = height / 2;

    // X軸、Y軸の端点
    this.xEdge = xEdge;
    this.yEdge = yEdge;
  }

  void draw() {
    noFill();
    beginShape();
    for (int i = 0; i < this.width; i++) {
      // ピクセルから座標に変換
      float x = map(i - this.cx, -this.cx, this.cx, -this.xEdge, this.xEdge);
      float y = funcToDraw(x);

      // 座標からピクセルに変換
      float xpixel = map(x, -this.xEdge, this.xEdge, 0, this.width);
      float ypixel = map(y, -this.yEdge, this.yEdge, this.height, 0);

      curveVertex(xpixel, ypixel);
    }

    line(0, this.cy, this.width, this.cy);
    line(this.cx, 0, this.cx, this.height);

    endShape();
  }

  float funcToDraw(float x) { return 0; }
}

