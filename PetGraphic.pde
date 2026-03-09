// =============================================
//
// OPTION A: Use Processing graphics
//   - Write your drawing code inside drawPetGraphic()
//   - You can make multiple versions (happy, sad, etc.)
//     and call the right one based on pet state
//
// OPTION B: Use images (PImage)
//   - Add image files to your sketch's /data folder
//   - Load them in loadPetImages() below
//   - Add them to the petImages ArrayList
//   - Display the right one in drawPetGraphic()
// =============================================


// =============================================
// OPTION B SETUP  (comment out if using Option A)
// =============================================

 ArrayList<PImage> petImages;   // one image per mood/state

 void loadPetImages() {
   petImages = new ArrayList<PImage>();
   petImages.add(loadImage("Neutral.png"));  // index 0 - neutral
   petImages.add(loadImage("Happy.png"));    // index 1 - happy
   petImages.add(loadImage("Sad.png"));      // index 2 - sad
//   // add more as needed!
 }
//
// Call loadPetImages() at the end of setup() in VirtualPet.pde


// =============================================
// Pet area background + border
// (shared by both options - leave this)
// =============================================

void drawPetArea() {
  // Background for the pet zone
  fill(220, 210, 245);
  stroke(180, 160, 220);
  strokeWeight(2);
  rect(20, 20, 380, 390, 16);

  // Draw whichever graphic option you're using
  drawPetGraphic();
}


// =============================================
// OPTION A: Drawing with Processing shapes
// Replace or add to the placeholder below!
// =============================================

void drawPetGraphic() {

  // ---- Placeholder shape ----
  // Replace this with your own drawing,
  // or swap it for an image (see Option B below).
  /*
  // Body
  fill(255, 100, 100);
  noStroke();
  ellipse(210, 220, 140, 120);
  
  // Head
  fill(255, 100, 100);
  ellipse(210, 145, 100, 90);

  // Eyes
  fill(50);
  ellipse(190, 138, 14, 14);
  ellipse(230, 138, 14, 14);

  // Eye shine
  fill(255);
  ellipse(195, 134, 5, 5);
  ellipse(235, 134, 5, 5);

  // Nose
  fill(255, 160, 180);
  ellipse(210, 152, 10, 7);

  // Mouth
  noFill();
  stroke(80);
  strokeWeight(2);
  arc(210, 160, 24, 14, 0, PI);

  // Ears
  fill(255, 100, 100);
  noStroke();
  triangle(178, 108, 168, 75, 195, 100);
  triangle(242, 108, 252, 75, 225, 100);

  // Inner ears
  fill(255, 180, 200);
  triangle(180, 105, 172, 82, 193, 100);
  triangle(240, 105, 248, 82, 227, 100);
 */
  // ---- END placeholder ----


  // =============================================
  // OPTION B: Display a PImage instead
  // =============================================

  int index = 0; // neutral default
  
  // Logic for sadness and happiness
  if (myPet.getHappinessLevel() < 30) {
    index = 2; // sad
  } else if (myPet.getEnergyLevel() >= 50 && myPet.getHappinessLevel() >= 50) {
    index = 1; // happy
  }

// Draw the image, scaling up the happy face to compensate for the smaller PNG
  if (index == 1) {
    // Pushed X left and Y up, increased width to 520 and height to 380
    image(petImages.get(index), 0, 35, 520, 370); 
  } else {
    // Standard size for neutral and sad
    image(petImages.get(index), 30, 75, 460, 320);
  }
}
