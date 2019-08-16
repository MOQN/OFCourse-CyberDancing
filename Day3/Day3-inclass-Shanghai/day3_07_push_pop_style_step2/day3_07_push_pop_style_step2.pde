size(400, 500);

fill(0, 0, 255); // blue
rect( 100, 100, 200, 80 );

pushStyle();
rectMode(CENTER);
fill(255, 0, 0); // red
strokeWeight(5);
rect( 100, 200, 200, 80 );
popStyle();

//rectMode(CORNER);
//strokeWeight(1);
//fill(0, 0, 255); // blue
rect( 100, 300, 200, 80 );
