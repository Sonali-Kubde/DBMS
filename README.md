# DBMS
ABSTRACT
This project is used in businesses for the recruitment process. This company will release the job openings. The employer will evaluate the applicants' eligibility based on the number of positions, test grades and determine whether they are suitable for the position. Employee recruitment and admin module will all be handled by this system. The HR team oversees the HR management system, which is used to mentor employees
DeSign
Below steps are involved in hiring new employees in the designed Database System:
1) Companies with the help of recruitment agencies will hire employees on their behalf. 
2) The recruitment process is started by the person in charge of recruitment by posting the job openings through various mediums. Applicants will apply to one or multiple positions with different set of documents like Resume, Cover Letter, etc.
3) Candidates are shortlisted based on their profile and are invited to a test or an interview. One interview can have multiple tests.
4) Candidates are then graded for their tests and interview by the interviewer with the detailed feedback irrespective of the result.
6) Applicants are evaluated on the basis of tests and interview.
7) Then as per the decision and hiring, final decision will be made.
8) Also, the interviews can be online or onsite, if onsite, candidate has facilities to reimburse their expenses.
9) If a rejected candidate complains about the interview process, then based on whether the complaint is valid or not, the candidate can appear for a re-interview.



**Database Schema**
 Tables:
1  Candidate’s Information	Candidate 	Store the candidate’s information like name, email,phone,etc
2		Address	Stores the address of the candidates 
3		Previous Experiences	Stores the previous work experiences of the candidate
6		BlockListCondidates	Stores the candidate information if he rejects the offer.
7	Jobs	Job	Stores all information about all the jobs in the organization
8		JobMedium	Stores the medium available for the jobs like online or onsite
9		JobType	Stores the type available like Summer Internship, Part time, full time or contract based. The tables data is referred by the job to assign the type of the job
10		JobOpenings	Stores the jobs opened for hiring.
11	Application	Application	Keep a track about the candidates applying for the job. It maintains a relationship between candidate and jobs and map the candidate to the jobs for which they apply
12		StatusChange	Due to the various steps in the process, the status of the application changes continuously. This table keeps a track of the status of the application
13		Status	It stores the statuses through which the application goes through the process.
14		Complaints	Stores the complaints from the candidate about the application.
15		Documents 	Store the mandatory documents like resume, Cover letter and transcripts
16		OtherDocuments	Stores the additional documents like cerifications, volunteer activities, etc
17		Negotiation	Stores the Negotiation details about the application.
18	Selection process	Test	Stores the details about the test results for the application like result, duration,etc. Also, it stores the interview id if the test is a part of it.
19		Interview	Stores the information about the interview.
20		Interviewer	Stores the interviewer information like name, department,etc
21		InterviewsConductedReviews	It is a linking table between interviewer and interview which stores the interviewer feedback on the interview 
22		Reviews	This stores the reviews of the interviewer and the candidate on each other
23		Evaluation	It stores the evaluation done by the interviewer on the interview
24	  Onboarding and Reimbursement	Onboarding	It stores the onboarding process like joining date, etc
25		Reimbursement	It stores the reimbursement allotted to the application in terms of food,travel and accommodation which is retrieved from the tables mentioned below
26		Food	It stores the food available for an employee details like number of swipes, hotel, etc.
27		Travel	It stores the travel details like reservation number, fare and flight details.
28		Accomodation	It stores the accommodation options available for the application.


**Relationships:**
•	One to many relationship from candidate to Address, Application and PreviousExperience.
•	One to one relationship from candidate to BlockListedCandidate and Onboarding.
•	Many to one relationship from job to jobType and jobMedium
•	One to One relationship from Job to Job Openings.
•	One to one relationship from Application to StatusChange, Complaints,Negotiation and Documents.
•	One to Many Relationship from Documents to OtherDocuments.
•	Many to one Relationship from StatusChange to Status.
•	One to Many Relationship from Application to Tests and interviews.
•	Interview and Interviewer are many to many relationship. Hence, InterviewsConductedReviews linking table is introduced.
•	One to Many Relationship from Reviews to Candidate, Interviewer and Interview.
•	One to any Relationship from Interview and Interviewer to Evaluation.
•	One to One Relationship from Application to Reiumbursement.
•	Many to one relationship from Reimbursement to Food, Travel and Accomodation






 




























































