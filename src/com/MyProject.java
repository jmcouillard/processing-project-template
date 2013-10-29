package com;

import java.awt.event.WindowEvent;
import java.awt.event.WindowFocusListener;

public class MyProject extends PApplet implements WindowFocusListener {

	private static final long serialVersionUID = 1;

	public final static int WIDTH = 1920;
	public final static int HEIGHT = 1080;

	public boolean focused = true;

	public void setup() {

		// Setup
		size(WIDTH, HEIGHT, OPENGL);
		hint(ENABLE_OPENGL_ERRORS);
		hint(DISABLE_TEXTURE_MIPMAPS);

		// Focus listener
		frame.addWindowFocusListener(this);
	}

	public void draw() {

		// Clear background
		background(0);
	}

	public void windowGainedFocus(WindowEvent e) {
		focused = true;
	}

	public void windowLostFocus(WindowEvent e) {
		focused = false;
	}


	public static void main(String[] args) {
		PApplet.main(new String[] { "--bgcolor=#000000", com.MyProject.class.getName() });		
	}

}
