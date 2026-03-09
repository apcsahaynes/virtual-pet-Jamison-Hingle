public class Golf {
    private String name;
    private int happinessIncr;
    private int weightDecr;
    private int energyDecr;
    
  public Golf (String name, int happinessIncr, int weightDecr, int energyDecr) {
      this.name = name;
      this.happinessIncr = happinessIncr;
      this.weightDecr = weightDecr;
      this.energyDecr = energyDecr;
  }
  
  public String getName () { return name; }
  public int getHappinessIncr () { return happinessIncr; }
  public int getWeightDecr () { return weightDecr; }
  public int getEnergyDecr () { return energyDecr; }
}
