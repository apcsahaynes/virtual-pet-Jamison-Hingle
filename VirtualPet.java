public class VirtualPet {
  private String name;
  private int energy;
  private int weight;
  private int happiness;
  private int ageMonths;
  private int ageYears;

  public VirtualPet(String name){
    this.name = name;
    this.energy = 50; // Starts at 50
    this.weight = 240;
    this.happiness = 0;
    this.ageMonths = 0;
    this.ageYears = 32;
  }

  public String getName(){ return name; }
  public int getEnergyLevel(){ return energy; }
  public int getWeight(){ return weight; }
  public int getAgeYears(){ return ageYears; }
  public int getHappinessLevel(){ return happiness; }

  // Death check method
  public boolean isDead() {
    return (energy <= 0 || weight < 100 || ageYears > 87);
  }

  public void feed(Food f){
     energy += f.getEnergyIncrease();
     if (energy > 100) {
       energy = 100; // Cap at 100
     }
     weight += f.getWeightGain();
     happiness += f.getHappinessIncrease();
  }

  public boolean play(Game g){
    if (g.isWinner()) {
      happiness += g.getHappinessIncr();
      return true;
    } else {
      // Removed the > 0 check so it can go negative
      happiness -= g.getHappinessIncr();
      return false;
    }
  }
  
  public void golf(Golf g){
     if (weight > 0) {
       happiness += g.getHappinessIncr();
       weight -= g.getWeightDecr();
       energy -= g.getEnergyDecr(); // Costs energy now
     }
  }
  
  // New WorkOut method
  public void workOut(WorkOut w) {
      energy -= w.getEnergyDecr();
      happiness -= w.getHappinessDecr();
      weight -= w.getWeightDecr();
  }
  
  public void updateStatus() {
      // Removed > 0 checks so they can drop below 0 if needed
      happiness -= 1;
      energy -= 1;
      
      ageMonths += 1;
      ageConverter();
  }
  
  private void ageConverter() {
      if (ageMonths >= 12) {
          ageYears += 1;
          ageMonths = 0;
      }
  }

  public String toString(){
    return name + "'s information: \nEnergy: " + energy 
    + "\nWeight: " + weight + "\nHappiness: " + happiness +
    "\nAge: " + ageYears + " years and " + ageMonths + " months";
  }
}
