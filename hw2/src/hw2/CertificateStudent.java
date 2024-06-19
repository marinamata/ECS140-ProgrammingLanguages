package hw2;

import java.text.DecimalFormat;

public class CertificateStudent extends Student {

	private String Major;
	private String StudentType;
	
	public CertificateStudent(String IDNum, String FirstName, String LastName, double Age, double CreditHours,
			String major) {
		super(IDNum, FirstName, LastName, Age, CreditHours, 0);
		// TODO Auto-generated constructor stub
		
		Major = major;
		StudentType = "Certificate Student";
		
	}

	//getters and setters
	public String getStudentType() {
		return StudentType;
}
	public String getMajor() {
		return Major;
	}
	
	
@Override
	public void computeFees() {
	//System.out.println("Computing fees for a Certificate Student");
    	final int fixedRate = 700;
    	final int creditHrsRate = 300;
    	int creditHours = (int)getCreditHours();
    	int courseFees = 0;
    	courseFees = fixedRate + (creditHours * creditHrsRate);
    	setFees(courseFees);
    	
}
	
	//printData()
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
    	
    	
    	DecimalFormat df = new DecimalFormat("#,###");
    	String formattedFees = df.format(getFees());
    	//System.out.println(getName() + " " + getLastName() + " has $" + formattedFees + " fees assessed");

    		}
    			
    	
    		
    }
