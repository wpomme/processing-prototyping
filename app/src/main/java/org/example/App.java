package org.example;

import java.awt.image.BufferedImage;

public class App {
  public String getGreeting() {
    return "Hello World!";
  }

  public static void main(String[] args) {
    Widget widget = new Widget();
    widget.display();

    Image image = new Image();

    int revs = 10;
    Spiral aspiral = new Spiral(400, 400, 10, revs, Spiral.Type.ARCHIMEDEAN);

    // NOTE: 本来Math.PIはdoubleであり、できれば修正した
    // float rad = (float) (Math.PI / 3);
    // nPoints = DEGREE * revs
    int nPoints = 360 * revs;
    image.setImage(aspiral.pixels, nPoints);

    // for (int i = 0; i < 4; i++) {
    //   float rotRad = rad * i;
    //   Pixel[] pixels = aspiral.rotate(rotRad);
    //   image.setImage(aspiral.pixels, nPoints);
    // }

    BufferedImage bImage = image.getImage();
    widget.setImageFrame(bImage);

    return;
  }
}
