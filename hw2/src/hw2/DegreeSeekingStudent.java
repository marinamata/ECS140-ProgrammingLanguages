package hw2;

import java.text.DecimalFormat;

public class DegreeSeekingStudent extends Student{
    //attributes
    private String major;
    private String standing;

    //constructor
    public DegreeSeekingStudent(String IDNum, String FirstName, String LastName, double Age, double CreditHours,
                                    String Major, String Standing, double StudentFees) {
    
        //corrected super constructor call
        super(IDNum, FirstName, LastName, Age, CreditHours, StudentFees);
        // TODO Auto-generated constructor stub
        
        major = Major;
        standing = Standing;
    }
    //getters and setters
    public String getStanding() {
    	return standing;
    }
    public String getMajor() {
    	return major;
    }
    
    @Override
    //computeFees
    public void computeFees() {
    	//Fees are a recreation and athletics fee of $100, a student union fee of $50, 
    	//and $275 per credit hour, up to a maximum of twelve credit hours
    	//System.out.println("Computing fees for a Degree-Seeking Student");
    	final int recreationFees = 100;
    	final int unionFees = 50;
    	int creditRate = 275;
    	int creditHours = (int)getCreditHours();
    	int courseFees = 0;
    	int totalFees = 0;
    	 
    	if(creditHours > 12) {
    		courseFees = creditRate * 12;
    	}else {
    		courseFees =creditRate * creditHours;
    	}
    	
    	totalFees = recreationFees + unionFees + courseFees;
    	setFees(totalFees);
    		
    }
    public String toString() {
    	return "Id Num: " + getIDNum() + ", Name: "+getName() + ", " + getLastName() + ", Total fees: $" + String.valueOf(getFees());
    }
    
      
    //printData method
    public void printData() {
        String majorInWords = "";
        String standingInWords = "";

        if ("s".equals(getMajor().toLowerCase())) {
            majorInWords = "Gaming Science";
        } else if ("m".equals(getMajor().toLowerCase())) {
            majorInWords = "Hotel Management";
        } else if ("a".equals(getMajor().toLowerCase())) {
            majorInWords = "Lounge Arts";
        } else if ("e".equals(getMajor().toLowerCase())) {
            majorInWords = "Beverage Engineering";
        }

        if ("g".equals(getStanding().toLowerCase())) {
            standingInWords = "Good";
        } else if ("w".equals(getStanding().toLowerCase())) {
            standingInWords = "Warning";
        } else if ("p".equals(getStanding().toLowerCase())) {
            standingInWords = "Probation";
        }

        DecimalFormat df = new DecimalFormat("#,###");
    	String formattedFees = df.format(getFees());
    	//System.out.println(getName() + " " + getLastName() + " has $" + formattedFees + " fees assessed");
        
    }
    			
    		
    	
    }
    
