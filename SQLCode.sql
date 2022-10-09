Drop table if exists Questions
create table Questions 
(
	QuestionID  int IDENTITY(1,1)primary key,

	Question varchar (8000),
	categoryID int not null,
	skillLevel int not null,
	constraint fk_question_category
		foreign key (categoryID) references Category (categoryID)

);

alter table Questions
add 

	categoryID int not null,
	skillLevel int not null,
	constraint fk_question_category
		foreign key (categoryID) references Category (categoryID)

;

drop table if exists Category
create table Category
(

	categoryID int IDENTITY(1,1) primary key,
	categoryName varchar(500),
)

select QuestionID,Question,categoryName into tblQuestionCategory 
from Questions q
left join Category  c on q.categoryID =c.categoryID 

insert into Questions (Question, categoryID, skillLevel) values 
('Have you put anyone on PIP? How did it play out?',10,1),
('Which one is harder? Hire or fire? Why?',10,1),
('How do you resolve conflicts within your team?',10,1),
('How do you handle escalations?',10,1),
('Tell me a time that you had to give tough feedback to someone.',10,1),
('How do you manage your team/reportees?',10,1),
('How would your reports describe you as a manager?',10,1),
('Do you micromanage?',10,1),
('How do you make sure your team delivers strong results?',10,1)
;