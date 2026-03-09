VirtualPet myPet;

Button feedButton;
Button playButton;
Button workOutButton;
Button playGolfButton;

// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 10000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  textFont(createFont("Arial", 40, true));

  myPet = new VirtualPet("Bryson");

  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 10, 430, 120, 45);
  playButton = new Button("Gamble", 140, 430, 120, 45);
  workOutButton = new Button("Work Out", 270, 430,120, 45);
  playGolfButton = new Button("Go Golfing", 400, 430, 120, 45);
  loadPetImages();
}

void draw() {
  background(245, 240, 255);

  // ---- Death Condition Check ----
  if (myPet.isDead()) {
    fill(200, 50, 50);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("YOUR PET DIED :(", width / 2, height / 2);
    return; // Stops drawing the rest of the UI
  }

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  feedButton.display();
  playButton.display();
  workOutButton.display();
  playGolfButton.display();
  drawMessage();
}

void mousePressed() {
  // Can't click buttons if dead
  if (myPet.isDead()) return; 

  if (feedButton.isClicked(mouseX, mouseY)) {
    Food f = new Food("Glizzy", 10, 5, 1);
    myPet.feed(f);
    showMessage(f.getName() + " eaten!");
  }

  if (playGolfButton.isClicked(mouseX, mouseY)) {
    // Added '5' as the energy cost
    Golf g = new Golf("Golf", 20, 1, 5); 
    myPet.golf(g);
    showMessage(g.getName() + " played!");
  }
  
  if (workOutButton.isClicked(mouseX, mouseY)) {
    // Replaced the Glizzy copy-paste with your new WorkOut class
    WorkOut w = new WorkOut("Lifting", 10, 5, 5); 
    myPet.workOut(w);
    showMessage(w.getName() + " completed!");
  }

  if (playButton.isClicked(mouseX, mouseY)) {
    Game g = new Game("RainBet", 50, 1);
    myPet.play(g);
    showMessage(g.getName() + " played!");
  }
}
// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
