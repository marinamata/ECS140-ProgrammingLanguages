package hw2;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.text.DecimalFormat;


public class Student {
	//list of attributes
	private String iDNum;
	private String firstName;
	private String lastName;
	private double age;
	private double creditHours;
	private double studentFees;
	
	//constructor
	public Student(String IDNum, String FirstName, String LastName, double Age, double CreditHours, double StudentFees) {
		iDNum = IDNum;
		firstName = FirstName;
		lastName = LastName;
		age = Age;
		creditHours = CreditHours;
		studentFees = StudentFees;
	}
	

	//getters and setters
	public String getIDNum() {
		return iDNum;
	}
	public String getName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public double getAge() {
		return age;
	}
	public double getCreditHours() {
		return creditHours;
	}
	public double getFees() {
		return studentFees;
	}
	public void setFees(double StudentFees) {
		studentFees = StudentFees;
	}
	
	 public void computeFees() {
	        
	    }


	public void printData() {
		// TODO Auto-generated method stub
		
	}
	
}