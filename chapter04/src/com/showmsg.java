package com;

import java.applet.Applet;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;

public class showmsg extends Applet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1978939073748554102L;
	
	String msg1,msg2,msg3;
	
	public void init() {
		msg1 = getParameter(msg1);
		msg2 = getParameter(msg2);
		msg3 = getParameter(msg3);
	}
	
	public void paint(Graphics g) {
		Font font = new Font("SansSerif",Font.BOLD,30);
		g.setFont(font);
		g.setColor(Color.blue);
		g.drawString(msg1, 20, 40);
		g.drawString(msg2, 20, 70);
		g.drawString(msg3, 20, 100);
	}
	
}
