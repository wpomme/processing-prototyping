package org.example;

import java.awt.GraphicsEnvironment;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Widget {
  private static final int HEIGHT = 1350;
  private static final int WIDTH = 1350;
  private static final String TITLE = "画像";
  private JFrame frame;

  Widget() {
    this.frame = new JFrame(TITLE);
  }

  public void display() {
    frame.setVisible(true);
    frame.setSize(HEIGHT, WIDTH);
    setLocation();
  }

  public void setImageFrame(BufferedImage image) {
    JLabel label = new JLabel();

    label.setIcon(new ImageIcon(image));
    frame.add(label);
    frame.pack();
  }

  /** 前提条件: monitorSize > WIDTH, HEIGHTとする */
  private void setLocation() {
    Rectangle bounds = GraphicsEnvironment.getLocalGraphicsEnvironment().getMaximumWindowBounds();

    int paddingTop = toCenter(HEIGHT, bounds.height);
    int paddingLeft = toCenter(WIDTH, bounds.width);

    frame.setLocation(paddingTop, paddingLeft);
  }

  private int toCenter(int widgetSize, int monitorSize) {
    return (widgetSize - monitorSize) / 2;
  }
}
