package hw2;

import java.text.DecimalFormat;

public class DegreeStudentWithFinancialAid extends DegreeSeekingStudent {

	//attributes
	//getFinancialAid()
	//toString()
	//computeFeeds()
	//printData()
private double financialAid;


	public DegreeStudentWithFinancialAid(String IDNum, String FirstName, String LastName, double Age,
			double CreditHours, String Major, String Standing, double dollarValues) {
		super(IDNum, FirstName, LastName, Age, CreditHours, Major, Standing, dollarValues);
		// TODO Auto-generated constructor stub
		financialAid = dollarValues;
	}
	
	//getters and setters
	public double getFinancialAid() {
		return financialAid;
	}
	
	@Override
    public void computeFees() {
		//System.out.println("Computing fees for a Degree Student with Financial Aid");
    	//Fees are a recreation and athletics fee of $100, a student union fee of $50, 
    	//and $275 per credit hour, up to a maximum of twelve credit hours
    	final double recreationFees = 100;
    	final double unionFees = 50;
    	double creditRate = 275;
    	double creditHours = getCreditHours();
    	double courseFees = 0.0;
    	
    	 
    	if(creditHours > 12) {
    		courseFees = creditRate * 12;
    	}else {
    		courseFees =creditRate * creditHours;
    	}
    	
    	//set the total fees, subtract scholarships
    	double totalFees = recreationFees + unionFees + courseFees - financialAid;
    	
    	//make sure total fees are not negative
    	if(totalFees<0) {
    		totalFees = 0;
    	}
    	
    	setFees(totalFees);
	
    		
    }
	

	//printData method
	public void printData() {
		String majorInWords = "";
		String standingInWords = "";
		if("s".equals(getMajor().toLowerCase())) {
			majorInWords = "Gaming Science";
		}else if
			("m".equals(getMajor().toLowerCase())){
				majorInWords = "Hotel Management";
		}else if
	    	("a".equals(getMajor().toLowerCase())){
	    		majorInWords = "Lounge Arts";
	    }else if
	        ("e".equals(getMajor().toLowerCase())){
	        	majorInWords = "Beverage Engineering";
	    }
		if("g".equals(getStanding().toLowerCase())) {
			standingInWords = "Good";
		}else if 
			("w".equals(getStanding().toLowerCase())) {
				standingInWords = "Warning";
		}else if
			("p".equals(getStanding().toLowerCase())){
				standingInWords = "Probation";
		}
		
		DecimalFormat df = new DecimalFormat("#,###");
    	String formattedFees = df.format(getFees());
    	//System.out.println(getName() + " " + getLastName() + " has $" + formattedFees + " fees assessed");

			}
	}
				
			
		
