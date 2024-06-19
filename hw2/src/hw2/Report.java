package hw2;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Report {
    private static final int MAX_NUMBER_OF_STUDENTS = 100;
    private static int student_fee; // Declare student_fee here
    private static String student_name; // Declare student_name here

    
    public static String generateReport() {
        StringBuilder reportBuilder = new StringBuilder();
        Student[] students = new Student[MAX_NUMBER_OF_STUDENTS];
        int studentCount = 0;
        int totalFees = 0;
        String student_name = "";

        
        
       
        try {
            Scanner scanner = new Scanner(new File("hw2.txt"));

            while (scanner.hasNextLine()) {
            	
                String s = scanner.nextLine();
                String[] studentData = s.split(";");
                
                if (studentData.length < 6) {
                	continue; 
                }
                
                String studentTypeCode = studentData[5];
                //System.out.println("studentTypeCode: " + studentTypeCode);

                Student student = null;
                //System.out.println("PStudent Type code: " + studentTypeCode);
                
                if (studentTypeCode.equals("Y")) {
                    // Degree-seeking student
                    String majorCode = studentData[6];
                    String standingCode = studentData[7];
                    String financialAssistanceCode = studentData[8];
                    String financialAssistanceAmount = null; // Default if not provided
                    

                    if (financialAssistanceCode.equals("Y") && studentData.length > 9) {
                        financialAssistanceAmount = studentData[9];
                    }

                    // Handle the case when financialAssistanceAmount is null
                    if (financialAssistanceAmount == null) {
                        // Create a degree-seeking student without financial assistance
                        student = createDegreeSeekingStudent(
                            studentData[0], studentData[1], studentData[2],
                            Integer.parseInt(studentData[3]), Integer.parseInt(studentData[4]),
                            majorCode, standingCode
                        );
                    } else {
                        // Create a degree-seeking student with financial assistance
                        student = createDegreeStudentWithFinancialAid(
                            studentData[0], studentData[1], studentData[2],
                            Integer.parseInt(studentData[3]), Integer.parseInt(studentData[4]),
                            majorCode, standingCode, Double.parseDouble(financialAssistanceAmount)
                        );
                    }
                } else {
                    // Non-degree-seeking student (e.g., certificate or senior citizen)
                    String nonDegreeCode = studentData[6];
                   // System.out.println("Non-Degree Code: " + nonDegreeCode); // Debugging

                    
                    if (nonDegreeCode.equals("C")) {
                        // Certificate student
                        String certificateTypeCode = studentData[7];
                        student = createCertificateStudent(
                            studentData[0], studentData[1], studentData[2],
                            Integer.parseInt(studentData[3]), Integer.parseInt(studentData[4]),
                            certificateTypeCode
                        );
                    } else if (nonDegreeCode.equals("S")) {
                        // Senior citizen
                        student = createSeniorStudent(
                            studentData[0], studentData[1], studentData[2],
                            Integer.parseInt(studentData[3]), Integer.parseInt(studentData[4])
                        );
                    } else {
                        // Handle any other cases or invalid data here
                        System.out.println("Invalid student type: " + studentTypeCode);
                        continue; // Skip this student and move to the next one
                    }
                }

                if (student != null) {
                    students[studentCount++] = student;
                    
                
            }}
           
        
            
            scanner.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        
        
        List<Student> nonNullStudents = new ArrayList<>();
        
        for (Student s : students) {
            if (s != null) {
              nonNullStudents.add(s);
            }
          }
        //System.out.println("Non null students: " + nonNullStudents);

        // INDIVIDUAL REPORTS, listing of all students and the fees they have each been assessed
        DecimalFormat df = new DecimalFormat("#,###"); // Create a DecimalFormat instance

        
       
        StringBuilder report = new StringBuilder();
        
      
		
		reportBuilder.append("Summary of each student's fees assessed: \n\n");
        for (Student s : nonNullStudents) {
          s.computeFees();  
          student_fee = (int) s.getFees(); // Assign the student's fee
          student_name = s.getName() +" "+ s.getLastName(); // Assign the student's name
          // Append the information to reportBuilder
          reportBuilder.append(student_name + " has $" + String.format("%,d", student_fee) + " fees assessed\n");
          // Rest of individual report
        }
        
        
        students[0].printData();
		students[1].printData();
        

		int degree_nofin_fees = 0;
		int degree_fin_fees = 0;
		int certificate_fees = 0;
		int senior_fees = 0;
		int total_fees = 0;

        for (Student student : nonNullStudents) {
            student.computeFees();

            if (student instanceof DegreeSeekingStudent) {
                if (student instanceof DegreeStudentWithFinancialAid) {
                    degree_fin_fees += student.getFees();
                } else {
                    degree_nofin_fees += student.getFees();
                }
            } else if (student instanceof CertificateStudent) {
                certificate_fees += student.getFees();
            } else if (student instanceof SeniorStudents) {
                senior_fees += student.getFees();
            }
        }
        reportBuilder.append("\n\n");
        reportBuilder.append("Summary of all student fees assessed: \n\n");
        reportBuilder.append("Degree-seeking students without financial assistance: $" + String.format("%,d", degree_nofin_fees) + "\n");
        reportBuilder.append("Degree-seeking students with financial assistance: $" + String.format("%,d", degree_fin_fees) + "\n");
        reportBuilder.append("Certificate students: $" + String.format("%,d", certificate_fees) + "\n");
        reportBuilder.append("Senior citizens: $" + String.format("%,d", senior_fees) + "\n\n");
        reportBuilder.append("Total fees assessed: $" + String.format("%,d", ( degree_nofin_fees + degree_fin_fees +certificate_fees +senior_fees )));

        return reportBuilder.toString();
        //return report.toString();

       }
    
    private static DegreeSeekingStudent createDegreeSeekingStudent(String IDNum, String firstName, String lastName, int age, int creditHours, String majorCode, String standingCode) {
        String major = mapMajorCodeToMajor(majorCode);
        String standing = mapStandingCodeToStanding(standingCode);

        return new DegreeSeekingStudent(IDNum, firstName, lastName, age, creditHours, major, standing, 0.0);
    }

    private static DegreeStudentWithFinancialAid createDegreeStudentWithFinancialAid(String IDNum, String firstName, String lastName, int age, int creditHours, String majorCode, String standingCode, double financialAssistanceAmount) {
        String major = mapMajorCodeToMajor(majorCode);
        String standing = mapStandingCodeToStanding(standingCode);

        return new DegreeStudentWithFinancialAid(IDNum, firstName, lastName, age, creditHours, major, standing, financialAssistanceAmount);
    }

    private static CertificateStudent createCertificateStudent(String IDNum, String firstName, String lastName, int age, int creditHours, String certificateTypeCode) {
        String certificateType = mapCertificateTypeCodeToType(certificateTypeCode);

        return new CertificateStudent(IDNum, firstName, lastName, age, creditHours, certificateType);
    }

    private static SeniorStudents createSeniorStudent(String IDNum, String firstName, String lastName, int age, int creditHours) {
        return new SeniorStudents(IDNum, firstName, lastName, age, creditHours, 0.0);
    }

    private static String mapMajorCodeToMajor(String majorCode) {
        switch (majorCode) {
            case "S":
                return "Gaming Science";
            case "M":
                return "Hotel Management";
            case "A":
                return "Lounge Arts";
            case "E":
                return "Beverage Engineering";
            default:
                return "Unknown";
        }
    }

    private static String mapStandingCodeToStanding(String standingCode) {
        switch (standingCode) {
            case "G":
                return "Good";
            case "W":
                return "Warning";
            case "P":
                return "Probation";
            default:
                return "Unknown";
        }
    }

    private static String mapCertificateTypeCodeToType(String certificateTypeCode) {
        switch (certificateTypeCode) {
            case "S":
                return "Gaming Science";
            case "M":
                return "Hotel Management";
            case "A":
                return "Lounge Arts";
            case "E":
                return "Beverage Engineering";
            default:
                return "Unknown";
        }
        
   
    }

    public static void main(String[] args) {
        // You can test your Report class by calling generateReport() and printing the result.
        System.out.println(generateReport());
    }
}