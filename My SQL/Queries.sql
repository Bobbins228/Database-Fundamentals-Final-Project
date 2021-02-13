use gym;
select * from Customer;
select * from MemberShip;
select * from Facility;
select * from WorkoutClass;
select * from Trains;
select * from WorkoutSession;
select * from CustomerPhone;
select * from Trainer;

#This query displays all of the trainer names and gyms that have carlow in its name.
select concat(fname, " ", lname) as "Trainer Name", facilityName as "Gym" from Trainer natural join trains natural join workoutClass join facility on facility.facilityid = workoutclass.facilityid where facilityName like "%Carlow" order by fname;

#This query will display the members names, where they are from and the type of membership they have.
select concat(fname, " ", lname) as "Member Name", county as "County", town as "Town", street as "Street", membershipType as "Membership Type" from Customer natural join Membership order by county;

#This query displays The member's names, their membership type and their start and end date.
select concat(fname, " ", lname) as "Member Name", membershipType as "Membership Type", startdate as "Start Date", enddate as "End Date" from Customer natural join Membership;

#This query shows the member's names, their workout, duration and what gym they go to.
select concat(fname, " ", lname) as "Member Name", workoutName as "Workout", concat(duration, " ", "hrs") as "Duration  (hrs)", facilityName as "Gym" from Customer 
join workoutclass on customer.customerid = workoutclass.customerid join facility on facility.facilityid = workoutclass.facilityid order by facilityName;

#This query displays the name of and number of members doing a workout that has less than 3 people doing it. 
select workoutName as "Workout", count(workoutName) as "Number of Members" from WorkoutClass natural join WorkoutSession natural join customer group by workoutName having count(workoutName) < 3 order by workoutName;

#This query shows a member, their workout, the date and time of their workout and the duration of that workout.
select concat(fname, " ", lname) as "Member Name", workoutName as "Workout", Workoutdate as Date, workouttime as Time, concat(duration, " ", "hrs") as "Duration  (hrs)" from WorkoutClass natural join WorkoutSession natural join customer order by duration;

#This query displays the trainer's names, the workout they supervise and the gym that they work at some gyms have trainers that supervise different classes .
select concat(fname, " ", lname) as "Trainer Name", workoutName as "Workout", facilityName as "Gym" from Trains join workoutClass on trains.workoutid = workoutclass.workoutId join facility on workoutClass.facilityId = facility.facilityId join Trainer on trains.trainerId = trainer.trainerId;

#This query displays the number of trainers that work in each gym.
select facilityName as "Gym", count(fname) as "Number of Trainers" from Trains join Trainer on trains.trainerid = trainer.trainerid join WorkoutClass on trains.workoutId = workoutClass.workoutId join facility on facility.facilityId = workoutClass.facilityId group by facilityName;

#This query displays the names and phone number(s) of all of the members
select concat(fname, " ", lname) as "Member Name", phoneNumber as "Phone Number(s)" from customerphone natural join customer order by fName;

#This query only displays member names, workouts, gyms and durations where the duration is in between 0.5hrs and 1.5hrs
select concat(fname, " ", lname) as "Member Name", workoutName as "Workout Name", duration as "Duration (hrs)", facilityName as "Gym" from Customer natural join Workoutclass join Facility on workoutClass.facilityId = facility.facilityId where duration between 0.5 and 1.5 order by duration;
