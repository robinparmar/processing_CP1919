/*	CP1919

	"EIGHTY SUCCESSIVE PERIODS of the first pulsar observed, CP1919 
	(Cambridge pulsar at 19 hours 19 minutes right ascension), are 
	stacked on top of one another using the average period of 1.33730 
	seconds in this computer-generated illustration produced at the 
	Arecibo Radio Observatory in Puerto Rico. Although the leading 
	edges of the radio pulses occur within a few thousandths of a
	second of the predicted times, the shape of the pulses is quite 
	irregular. Some of this irregularity in radio reception is caused 
	by the effects of transmission through the interstellar medium. 
	The average pulse width is less than 50 thousandths of a second." 
	-- Ostriker, Jeremiah P. 1971. "The Nature of Pulsars", 
	Scientific American (January 1971).

	Peter Saville designed the cover of Joy Division's debut album
	"Unknown Pleasures" (Factory Records, 1979) around this diagram.
 
	Data is 80 lines of 300 points. 

	Sourced from Michael Zoellner. 
	License: cc-by-nc-sa-3.0.
	http://i.document.m05.de/2013/05/23/joy-divisions-unknown-pleasures-printed-in-3d/

	Copyright (c) 2019 Robin Parmar. MIT License.
*/

void setup() {
    size(900, 900, FX2D);
    background(0);
    pulsar();
    noLoop();
}

void pulsar() {
    color c = color(255, 140);
    float yInc = 5.;
    
    Table tab = loadTable("CP1919.csv");
    int rows = tab.getRowCount();
    int cols = tab.getColumnCount();
    // println(rows, cols);

	// centre
    float xOff = (width-cols) / 2.;
    float yOff = (height - (yInc * rows)) / 2.;

    PShape s;
    
    float y = yOff;
    for (int j=0; j<rows; j++) {
        s = createShape();    
        s.beginShape();
        s.fill(color(0));
        s.stroke(c);
        s.strokeWeight(1);
        
        for (int i=0; i<cols; i++) {
			s.vertex(xOff + i, y - tab.getFloat(j, i));
  		}
        s.endShape();
        shape(s);

        y += yInc;
  	}
	fill(c);
  	text("CP 1919", xOff, yOff - 20);
}
