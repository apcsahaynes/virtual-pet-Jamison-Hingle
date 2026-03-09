public class WorkOut {
    private String name;
    private int energyDecr;
    private int happinessDecr;
    private int weightDecr;
    
  public WorkOut (String name, int energyDecr, int happinessDecr, int weightDecr) {
      this.name = name;
      this.energyDecr = energyDecr;
      this.happinessDecr = happinessDecr;
      this.weightDecr = weightDecr;
  }
  
  public String getName () { return name; }
  public int getEnergyDecr () { return energyDecr; }
  public int getHappinessDecr () { return happinessDecr; }
  public int getWeightDecr () { return weightDecr; }
}
