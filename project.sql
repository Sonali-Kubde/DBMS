
IMLEMENTATION
A.	Table Creation
create table HR.Candidate(
CandidateId int primary key,
Name varchar(50),
EmailAddress varchar(50),
Phone int
)

Create table HR.Address(
CandidateId int foreign key references HR.Candidate(CandidateID),
Street varchar(100),
City varchar(20),
State varchar(20),
PostalCode int,
Country varchar(20)
)

create table HR.BlocklistCandidate(
CandidateId int foreign key references HR.candidate(CandidateId),
Reason varchar(100)
)

create table HR.Onboarding(
OnboardingId int primary key,
CandidateId int foreign key references HR.candidate(CandidateId),
StartDate date
)

create table HR.PreviousExperience(
ExperienceID int primary key,
CandidateID int foreign key references HR.Candidate(CandidateId),
Company varchar(50),
Position varchar(20),
StartDate date,
EndDate date,
ReasonForLeaving varchar(200),
)

create table HR.JobType(
JobTypeId int primary key,
JobType varchar(20)
)

create table HR.JobMedium(
JobMediumId int primary key,
JobMedium varchar(20)
)

create table HR.Job(
JobId int primary key,
Position varchar(50),
JobTypeId int foreign key references HR.JobType(JobTypeId),
JobMediumType int foreign key references HR.JobMedium(jobMediumId),
jobPlatform varchar(40)
)

create table HR.JobOpenings(
JobOpeningId int primary key,
JobId int foreign key references HR.Job(JobId),
CurrentOpenings int,
PostedDate date,
ApplicationDeadline date,
JoiningDate date,
JobType varchar(30)
)

create table HR.Status(
StatusId int primary key,
StatusName varchar(20)
)

create table HR.StatusChange(
StatusChangeID int primary key,
ApplicationId int foreign key references HR.Application(ApplicationId),
StatusId int foreign key references HR.Status(StatusId)
)


create table HR.Application(
ApplicationId int primary key,
CandidateId int foreign key references HR.Candidate(CandidateId),
JobOpeningId int foreign key references HR.Jobopenings(JobOpeningId),
ApplicationDate date,
Phone int
)

create table HR.food(
FoodId int primary key,
HotelName varchar(50),
NumberOfSwipesPerMonth int,
Location varchar(100)
)

create table HR.Travel(
TravelID int primary key,
FlightNumber int,
ReservationNumber int,
Fare money
)

create table HR.Accomodation(
AccomodationId int primary key,
HotelName varchar(100),
Fare money
)

create table HR.Reimbursement(
ReimbursementId int primary key,
ApplicationId int foreign key references HR.Application(ApplicationId),
FoodId int foreign key references HR.Food(FoodId),
TravelId int foreign key references HR.Travel(TravelId),
AccomodationId int foreign key references HR.Accomodation(AccomodationId)
)

create table HR.Documents(
DocumentId int primary key,
ApplicationId int foreign key references HR.Application(ApplicationId),
Resume varchar(500),
CoverLetter varchar(500),
Transcripts varchar(500)
)

create table HR.OtherDocuments(
DocumentId int foreign key references HR.Documents(DocumentId),
DocumentName varchar(50),
DocumentLink varchar (500)
)

create table HR.complaints(
ApplicationId int foreign key references HR.Application(ApplicationId),
Complaint varchar(100),
ComplaintStatus varchar(50)
)

create table HR.Interview(
InterviewId int primary key,
applicationId int foreign key references HR.Application(ApplicationId),
InterviewDate date,
)

create table HR.interviewers(
InterviewerId int primary key,
InterviewerName varchar(50),
Position varchar(50),
Department varchar(50)
)

create table HR.InterviewsConductedReviews(
InterviewerId int foreign key references HR.Interviewers(InterviewerId),
InterviewId int foreign key references HR.Interview(InterviewId),
Reviews varchar(500)
)

create table HR.Reviews(
InterviewerId int foreign key references HR.interviewers(InterviewerId),
InterviewId int foreign key references HR.interview(interviewId),
CandidateId int foreign key references HR.Candidate(CandidateId),
InterviewReview varchar(500),
CandidateReview varchar(500)
)

create table HR.negotiatedApplication(
NegotiationNumber int primary key,
ApplicationId int foreign key references HR.Application(ApplicationId),
CurrentOffer money,
ExpectedOffer money,
NegotiatedStatus varchar(100)
)

create table HR.Evaluation(
interviewerId int foreign key references HR.interviewers(interviewerId),
applicationId int foreign key references HR.Application(ApplicationId),
Result varchar(500)
)

create table HR.Test(
TestId int primary key,
ApplicationId int foreign key references HR.Application(ApplicationId),
InterviewId int foreign key references HR.Interview(InterviewId),
TestDate date,
Marks int,
Result varchar(10)
)
B.	Values Insertion
insert into HR.candidate values
(1, 'Sonali Sanjay Kubde','skubde@syr.edu',	'3158864565'),
(2	,'Pranjal',	'pghan@syr.edu'	,'3158864562'),
(3,	'Sowmeya',	'spillai@syr.edu',	'3158864563'),
(4,	'Rasika'	,'rdandgaval@syr.edu',	'3158864564'),
(5,	'Parth'	,'pkulka@syr.edu',	'3158864566'),
(6,	'Raj'	,'rshah@syr.edu',	'3158864567'),
(7,	'Jay'	,'jmaru@syr.edu'	,'3158864568'),
(8,	'Shriram'	,'sdeshmukh@syr.edu',	'3158867565'),
(9	,'Annushree',	'amaru@syr.edu'	,'3158864565'),
(10	,'Yash'	,'yshah@syr.edu',	'3158864565')

insert into HR.Documents values
(1,1,'Resume1','CL1','Transcript1'),
(2,2,'Resume2','CL2','Transcript2'),
(3,3,'Resume3','CL3','Transcript3'),
(4,4,'Resume4','CL4','Transcript4'),
(5,5,'Resume5','CL5','Transcript5'),
(6,6,'Resume6','CL6','Transcript6'),
(7,7,'Resume7','CL7','Transcript7'),
(8,8,'Resume8','CL8','Transcript8'),
(9,9,'Resume9','CL9','Transcript9'),
(10,10,'Resume11','CL10','Transcript10')

insert into HR.OtherDocuments values
(2,'AWS Certification','Certi1')

insert into HR.Address values
(1,'822 Westcott','Syracuse','New York',13210,'US'),
(2,'822 Westcott','Syracuse','New York',13210,'US'),
(3,'822 Westcott','Syracuse','New York',13210,'US'),
(4,'822 Westcott','Syracuse','New York',13210,'US'),
(5,'826 Westcott','Syracuse','New York',13210,'US'),
(6,'827 Westcott','Syracuse','New York',13210,'US'),
(7,'822 Lancaster','Syracuse','New York',13210,'US'),
(8,'822 Comstock','Syracuse','New York',13210,'US'),
(9,'822 PL','Syracuse','New York',13210,'US'),
(10,'822 Maryland','Syracuse','New York',13210,'US')

insert into HR.JobType values
(1,'Summer Internship'),
(2,'Part Time'),
(3,'Full Time'),
(4,'Contract Based')

insert into HR.JobMedium values
(1,'Onsit'),
(2,'Online')

insert into HR.Job values
(1,'SDE 1',2,2,'Linkedin','IT'),
(2,'SDE 2',2,2,'Linkedin','IT'),
(3,'HR',2,2,'Linkedin','HR'),
(4,'Manager',3,1,'Linkedin','Managerial'),
(5,'Senior Manager',1,1,'Linkedin','Managerial'),
(6,'TechLead',4,1,'Linkedin','Managerial'),
(7,'Consultant',2,2,'Linkedin','Customer Service'),
(8,'Senior Consultant',4,2,'Linkedin','Customer Service'),
(9,'Construction Manager',3,1,'Linkedin','Construction'),
(10,'Cloud Engineer',3,1,'Linkedin','Cloud')

insert into HR.JobOpenings values
(1,4,6,'05-23-2022','08-29-2022','06-01-2023'),
(2,2,12,'05-23-2022','08-29-2022','06-01-2023'),
(3,6,9,'05-23-2022','08-29-2022','06-01-2023'),
(4,9,5,'05-23-2022','08-29-2022','06-01-2023'),
(5,3,3,'05-23-2022','08-29-2022','06-01-2023'),
(6,10,16,'05-23-2022','08-29-2022','06-01-2023')

insert into HR.Application values
(1,2,5,'05-29-2022'),
(2,3,4,'05-29-2022'),
(3,3,6,'05-29-2022'),
(4,9,4,'05-29-2022'),
(5,4,5,'05-29-2022'),
(6,10,1,'05-29-2022'),
(7,1,5,'05-29-2022'),
(8,3,2,'05-29-2022'),
(9,8,6,'05-29-2022'),
(10,7,1,'05-29-2022')

insert into HR.Status values
(1, 'on call with next opportunity status'),
(2, 'Declined'),
(3, 'Accepted'),
(4,'Waiting'),
(5, 'Rejected'),
(6, 'Under Review'),
(7, 'Negotiation')

insert into HR.StatusChange values
(1,1,6),
(2,2,2),
(3,3,2),
(4,4,4),
(5,5,3),
(6,6,2),
(7,7,5),
(8,8,1),
(9,9,3),
(10,10,3)

insert into HR.Interview values
(2,3,'Online','07-25-2022'),
(3,4,'Online','07-25-2022'),
(4,5,'Online','07-25-2022'),
(5,6,'Online','07-25-2022'),
(6,7,'Online','07-25-2022'),
(7,8,'Online','07-25-2022'),
(8,9,'Online','07-25-2022'),
(9,10,'Online','07-25-2022'),
(10,9,'Online','07-25-2022'),
(11,8,'Online','07-25-2022')

insert into HR.interviewers values
(1,'Pranita','Manager','Managerial'),
(2,'Anjali','Manager','Managerial'),
(3,'Tanmay','Manager','Managerial'),
(4,'Nihar','Manager','Managerial'),
(5,'Niharika','Manager','Managerial'),
(6,'Roshni','Manager','Managerial'),
(7,'Niketan','Manager','Managerial'),
(8,'Ryan','Manager','Managerial'),
(9,'Harsh','Manager','Managerial'),
(10,'Heet','Manager','Managerial')

insert into HR.InterviewsConductedReviews values
(1,1,'Good'),
(2,2,'Best'),
(3,3,'Documents Not Submitted'),
(4,4,'Best'),
(5,5,'Good'),
(6,6,'Can do better'),
(7,7,'Good'),
(8,8,'Best'),
(9,9,'Good'),
(10,10,'Best'),
(6,1,'Good'),
(2,6,'Conceots not cleared'),
(5,11,'Good')

insert into HR.Reviews values
(1,1,'Good'),
(2,2,'Best'),
(3,3,'Good'),
(4,4,'Best'),
(5,5,'Good'),
(6,6,'Can do better'),
(7,7,'Good'),
(8,8,'Best'),
(9,9,'Good'),
(10,10,'Best'),
(6,1,'Good'),
(2,6,'Conceots not cleared')

insert into HR.Reviews values
(1,1,3,'Good','Fair'),
(2,2,3,'Best','Fair'),
(3,3,9,'Documents Not Received','Already Submitted'),
(4,4,4,'Best','Fair'),
(5,5,10,'Good','Fair'),
(6,6,1,'Can do better','Fair'),
(7,7,3,'Good','Fair'),
(8,8,8,'Best','Fair'),
(9,9,7,'Good','Fair'),
(10,10,8,'Best','Fair'),
(6,1,3,'Good','Fair'),
(2,6,1,'Concepts not cleared','Fair')

insert into HR.complaints values
(4,'Already submitted the document but it is not reflected on my profile','Not Resolved')

insert into HR.Test values
(1,2,null,'07-23-2022',80,'Pass'),
(2,3,null,'07-23-2022',85,'Pass'),
(3,4,null,'07-23-2022',89,'Pass'),
(4,5,null,'07-23-2022',79,'Pass'),
(5,7,null,'07-23-2022',32,'Fail'),
(6,7,6,'07-23-2022',30,'Fail'),
(7,7,6,'07-23-2022',60,'Pass'),
(8,10,9,'07-23-2022',80,'Pass'),
(9,2,1,'07-23-2022',80,'Pass'),
(10,2,1,'07-23-2022',80,'Pass')


insert into HR.Evaluation values
(2,3,'Pass'),
(3,4,'Fail'),
(4,5,'Pass'),
(5,6,'Pass'),
(6,7,'Fail'),
(7,8,'Pass'),
(8,9,'Pass'),
(9,10,'Pass'),
(6,9,'Pass'),
(5,8,'Pass')


insert into HR.Onboarding values
(1,4,'06-01-2023'),
(2,7,'06-01-2023'),
(3,7,'06-01-2023')

insert into HR.travel values
(1,234555,43423,12000),
(2,43424,53252,24000),
(3,432523,53252,53455)

insert into HR.Accomodation values
(1,'Sheraton',12000),
(2,'AirBNB',13895),
(3,'MintHotel',43245)

insert into HR.food values
(1,'Sheraton',60,'Mumbai'),
(2,'AirBNB',60,'Pune'),
(3,'MintHotel',60,'Chennai')

insert into HR.Reimbursement values
(1,5,1,2,3),
(2,7,2,3,1),
(3,8,3,2,1)

create table HR.Test(
testId int primary key,
ApplicationId int foreign key references HR.Application(ApplicationId),
InterviewId int foreign key references HR.Interview(InterviewId),
TestDate date,
Marks int,
Result varchar(10)
)
















C.	Views
1.	Query:
create view HR.JobView as
select JobId, Position, JobMedium , JobType from HR.Job j, HR.JobMedium jm,HR.JobType jt where j.JobTypeId = jt.JobTypeId and j.JobMediumType = jm.JobMediumId;

This view is created so that to get the Job details in one view.

 
2.	Query:
create view HR.ApplicationDetail as 
select a.ApplicationId,Name,StatusName from HR.Application a, HR.Candidate c, HR.StatusChange sc, HR.Status s where a.CandidateId=c.CandidateId and a.ApplicationId=sc.ApplicationId and sc.StatusId=s.statusId;

It gives the application details including its candidate name and currentStatus in a single view.

 





3.	Query:
create view HR.InterReviewDetail as
select i.interviewId,ad.Name,its.interviewerId,InterviewerName,Reviews as InterviewersFeedback from HR.Interview i,HR.Interviewers its, HR.InterviewsConductedReviews icr,HR.Application a,HR.ApplicationDetail ad
where i.InterviewId=icr.InterviewId and icr.InterviewerId= its.InterviewerId and i.applicationId=a.ApplicationId and a.ApplicationId= ad.applicationId;

We used the view created in view 2 ie ApplicationDetail and hence, providd the entire data about the interviews including candidate name, interviewer name and the reviews about the the interview.
 
4.	Query:
create view ApplicantContactInfo as
select Name, EmailAddress,Phone from HR.Candidate;

This gives the contact info excluding the CandidateID
 








D.	STORED PROCEDURE
#1.	Query:
create PROCEDURE HR.assignGrade as
Begin
update HR.Test
set result= CASE
when Marks>=60 then 'Pass'
else 'Fail'
end
end
GO
exec HR.assignGrade

It assigns the result depending upon the marks.
 
#2.	Query:
Create PROCEDURE HR.ComplaintStatusUpdate AS
BEGIN
update HR.Complaints
set ComplaintStatus = CASE
when isvalid= 0 then 'Rejected'
else 'Reinterview'
end
end
GO
EXEC HR.ComplaintStatusUpdate
 
 























#3.	Query:
create PROC HR.feedbackAssign as
BEGIN
update HR.InterviewsConductedReviews
set Reviews = CASE
when Reviews like '%Good%' or Reviews like '%Best%' then 'Positive'
else 'Negative'
end
end
GO
EXEC HR.feedbackAssign

#It is used to classify the reviews as positive or negative.
 
 










DECLARE 
@CandidateId int,
@Reason varchar(50) = 'Declined Offer';

SELECT @CandidateId = c.CandidateId FROM HR.Candidate c,HR.Application a, HR.statusChange sc 
WHERE a.ApplicationId= sc.ApplicationId and sc.StatusId = 2 and a.CandidateId= c.CandidateId;

INSERT INTO HR.blocklistCandidate 
       VALUES (@CandidateId, @Reason) 

END
GO

EXEC HR.addBlockList

#This add the candidate id and reason in the blocklist for whom status is declined.
 
 



#E.	Functions:
1.	Query:
Create function HR.InterviewDetails(@InterviewID int)
Returns Table
Return
(
 select i.InterviewId,a.candidateID,c.Name , Reviews,
InterviewDate,
 iw.InterviewerName
 from HR.Application a,HR.Interview i,HR.interviewers iw, HR.InterviewsConductedReviews icr,HR.Candidate c 
 where c.CandidateId = a.CandidateId and a.ApplicationId=i.applicationId and icr.InterviewerId=iw.InterviewerId and icr.InterviewId=i.InterviewId and icr.InterviewId = @InterviewId
);
GO

select * from HR.InterviewDetails(2)

#It returns the interview Details for Id 2
 








