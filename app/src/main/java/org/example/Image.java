package org.example;

import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Path2D;
import java.awt.image.BufferedImage;

public class Image {
  BufferedImage image;

  Image() {
    this.image = new BufferedImage(800, 800, BufferedImage.TYPE_INT_RGB);
  }

  public void setImage(Pixel[] pixels, int nPoints) {
    Graphics graphics = image.createGraphics();
    Graphics2D g2 = (Graphics2D) graphics;
    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

    g2.setStroke(new BasicStroke(2f));
    Path2D.Float path = new Path2D.Float();

    // 始点はmoveToメソッドで追加する必要がある
    path.moveTo(pixels[0].x, pixels[0].y);
    for (int i = 1; i < nPoints; i++) {
      path.lineTo(pixels[i].x, pixels[i].y);
    }

    g2.draw(path);
  }

  public BufferedImage getImage() {
    return image;
  }
}
