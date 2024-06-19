package hw2;

import java.text.DecimalFormat;

public class SeniorStudents extends Student{
	private String studentType;
	
	public SeniorStudents(String IDNum, String FirstName, String LastName, double Age, double CreditHours, double StudentFees) {
		super(IDNum, FirstName, LastName, Age, CreditHours, StudentFees);
		// TODO Auto-generated constructor stub
		studentType = "Senior Student";
	}
	//getters and setters
	public String getStudentType() {
		return studentType;
	}
	
	//fees senior students
	//Senior citizen: fees are a fixed assessment of $100 per term for six or fewer enrolled credit hours. 
	//Add an additional $50 for every credit hour greater than six.
	//computeFees
    @Override
	public void computeFees() {
    	//System.out.println("Computing fees for a Senior Student");
    	final double fixedAssesment = 100;
    	final double additionalAmount  = 50;
    	double creditsHrs = getCreditHours();
    	double courseFees = 0.0;
    	
    	if(creditsHrs<=6.0) {
    		courseFees = fixedAssesment;
    	}
    	else {
    		courseFees = fixedAssesment + (additionalAmount*(creditsHrs - 6.0));
    				
    	}
    	
    	setFees(courseFees);
    		
    }
  
   
  //printData method
  	public void printData() {
  	
  		
  		DecimalFormat df = new DecimalFormat("#,###");
    	String formattedFees = df.format(getFees());
    	//System.out.println(getName() + " " + getLastName() + " has $" + formattedFees + " fees assessed");
	}
  	}
  		
	


