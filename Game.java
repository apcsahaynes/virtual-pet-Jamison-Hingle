public class Game {
    private String name;
    private int happinessIncr;

    
  public Game (String name, int happinessIncr, int weightDecr) {
      this.name = name;
      this.happinessIncr = happinessIncr; 
  }
  
  public String getName () {
      return name;
  }
  
  public int getHappinessIncr () {
      return happinessIncr;
  }
  
  public boolean isWinner () {
      if (Math.random()>0.5) {
          return true;
      } else {
          return false;
      }
  }
}
