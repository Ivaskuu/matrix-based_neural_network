public class Population
{
  private NeuralNetwork[] elements;
  private int popNum;
  private int generationNum;
  private int inputsNum;
  
  private double cumulativeFitness;
  private double[] elementsFitness;
  
  public Population(int populationNum, double mutationRate, int num)
  {
    generationNum = 1;
    popNum = populationNum;
    inputsNum = num;
    elements = new NeuralNetwork[popNum];
    int[] topology = new int[] {num, num, num};
    
    for(int i = 0; i < popNum; i++)
    {
      elements[i] = new NeuralNetwork(topology);
    }
  }
  
  public void train()
  {
    while(true)
    {
      println("\n -- Generation " + generationNum);
      
      double[] error = new double[popNum];
      double[] randNum = new double[inputsNum];
      
      // Generate a random number
      for(int i = 0; i < inputsNum; i++)
      {
        randNum[i] = random(0.5, 1);
      }
      
      for(int i = 0; i < popNum; i++)
      {
        double[] results = elements[i].feedForward(randNum);
        error[i] = calculateError(randNum, results);
      }
      
      prepareForReproduction(error);
      printMedianErrorSquared(error);
      
      reproduce();
            
      generationNum++;
    }
  }
  
  private void mutate()
  {
    for(int i = 0; i < popNum; i++)
    {
    
    }
  }
  
  private double calculateError(double[] inputs, double[] results)
  {
    double error = 0;
    for(int i = 0; i < inputsNum; i++)
    {
      error += inputs[i] - results[i];
    }
    
    return error;
  }
  
  public void reproduce()
  {
    // Kill half of the population
    for(int i = 0; i < popNum / 2; i++)
    {
      int elemPos;
      
      do
      {
        elemPos = binarySearch(cumulativeFitness * random(1));
      }
      while(elements[elemPos] == null);
      
      elements[elemPos] = null;
    }
    
    for(int i = 0; i < popNum; i++)
    {
      if(elements[i] == null) // Copy weights (genes) from another element
      {
        int elemPos;
        do
        {
          elemPos = (int)(random(1) * popNum);
        }
        while(elements[elemPos] == null);
        
        elements[i] = elements[elemPos];
      }
    }
  }
  
  void prepareForReproduction(double[] error)
  {
    elementsFitness = new double[popNum];
    cumulativeFitness = 0;
    
    for(int i = 0; i < popNum; i++)
    {
      cumulativeFitness += Math.pow((1 / error[i]) * 100, 2); // ^4 gives the best elements even more chance of being selected;
      elementsFitness[i] = cumulativeFitness;
    }
  }
  
  int binarySearch(double value)
  {
    int lPos = 0;
    int rPos = popNum - 1;
    int middle;
    
    if(value < elementsFitness[0]) return 0;
    else if(value <= elementsFitness[popNum-1] && value > elementsFitness[popNum-2]) return popNum - 1;
    
    while(true)
    {
      middle = (lPos + rPos) / 2;
      
      if(value >= elementsFitness[middle - 1] && value <= elementsFitness[middle])
      {
        return middle;
      }
      else if(value < elementsFitness[middle])
      {
        rPos = middle;
      }
      else if(value > elementsFitness[middle])
      {
        lPos = middle;
      }
      else
      {
        println("wtf");
      }
    }
  }
  
  void printMedianErrorSquared(double[] error)
  {
    double medianError = 0;
    for(int i = 0; i < error.length; i++)
    {
      medianError += error[i];
    }
    
    println("Median error : " + medianError / error.length);
    
    //delay(1000);
  }
}