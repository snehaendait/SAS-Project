
/* 6. Read Excel spreadsheets into SAS using:
	a)	LIBNAME statement to read multiple pages of a excel file
	b)	Proc IMPORT (generate the code)
	c)	Proc EXPORT (generate the code)
	d)	LIBNAME statement with CLEAR option
*/

libname health excel "W:\My Documents\My SAS Files\Microsoft_Health_20150418_20150831.xls"; /* 6a */

PROC IMPORT OUT= WORK.Activity /* 6b */
            DATAFILE= "W:\My Documents\My SAS Files\Microsoft_Health_201
					   50418_20150831.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="'Activity summary$'"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

PROC EXPORT DATA= WORK.ACTIVITY /* 6c */
            OUTFILE= "W:\My Documents\SAS Project\exported.xls" 
            DBMS=EXCEL REPLACE;
     SHEET="activity"; 
RUN;

libname health clear; /* 6d */

/* 8. Use the following to read in a data set that has FORMATTED data:
	a)	INFILE
	b)	INPUT using at least 4 INFORMATs
	c)	FORMAT statement to re-format at least 2 variables
	d)	Proc PRINT
*/

libname health "W:\My Documents\SAS Project";

data health.activity; /* 8a */
	length Event_Type	$10. Cardio_Benefit $12. Sleep_Restoration $8. Sleep_Auto_Detect $6. ;
	infile "W:\My Documents\SAS Project\Activity.csv" dlm=',' dsd missover;
	input Input_Date :mmddyy9. Start_Time :time. Event_Type	Duration_Seconds	Seconds_Paused	Calories_Burned	
		  Calories_Burned_Carbs	Calories_Burned_Fats	HR_Lowest	HR_Peak	HR_Average	
		  UV_Exposure_Minutes	Total_Kilometers_Moved	Cardio_Benefit	Minutes_Under_50_HR	
		  Minutes_In_HRZ_Very_Light_50_60	Minutes_In_HRZ_Light_60_70	
		  Minutes_In_HRZ_Moderate_70_80	Minutes_In_HRZ_Hard_80_90	Minutes_In_HRZ_Very_Hard_90_Plus	
		  HR_Finish	HR_Recovery_Rate_1_Min	HR_Recovery_Rate_2_Min	Recovery_Time_Seconds	Bike_Average_KPH	
		  Bike_Max_KPH	Elevation_Highest_Meters	Elevation_Lowest_Meters	Elevation_Gain_Meters	
		  Elevation_Loss_Meters	Wake_Up_Time :MDYAMPM20.2	Seconds_Awake	Seconds_Asleep_Total	Seconds_Asleep_Restful	
		  Seconds_Asleep_Light	Wake_Ups	Seconds_to_Fall_Asleep	Sleep_Efficiency	Sleep_Restoration	
		  Sleep_HR_Resting	Sleep_Auto_Detect	GW_Plan_Name	GW_Reps_Performed	GW_Rounds_Performed	
		  Golf_Course_Name	Golf_Course_Par	Golf_Total_Score	Golf_Par_or_Better	Golf_Pace_of_Play_Minutes	
		  Golf_Longest_Drive_Yards;
run;

data health.activity; /* 8b */
	length Event_Type	$10. Cardio_Benefit $12. Sleep_Restoration $8. Sleep_Auto_Detect $6. ;
	infile "W:\My Documents\SAS Project\Activity.csv" dlm=',' dsd missover;
	input Input_Date :mmddyy9. Start_Time :time. Event_Type :$10.	Duration_Seconds :7. Seconds_Paused	Calories_Burned	
		  Calories_Burned_Carbs	Calories_Burned_Fats	HR_Lowest	HR_Peak	HR_Average	
		  UV_Exposure_Minutes	Total_Kilometers_Moved	Cardio_Benefit	Minutes_Under_50_HR	
		  Minutes_In_HRZ_Very_Light_50_60	Minutes_In_HRZ_Light_60_70	
		  Minutes_In_HRZ_Moderate_70_80	Minutes_In_HRZ_Hard_80_90	Minutes_In_HRZ_Very_Hard_90_Plus	
		  HR_Finish	HR_Recovery_Rate_1_Min	HR_Recovery_Rate_2_Min	Recovery_Time_Seconds	Bike_Average_KPH	
		  Bike_Max_KPH	Elevation_Highest_Meters	Elevation_Lowest_Meters	Elevation_Gain_Meters	
		  Elevation_Loss_Meters	Wake_Up_Time :MDYAMPM20.2	Seconds_Awake	Seconds_Asleep_Total	Seconds_Asleep_Restful	
		  Seconds_Asleep_Light	Wake_Ups	Seconds_to_Fall_Asleep	Sleep_Efficiency	Sleep_Restoration	
		  Sleep_HR_Resting	Sleep_Auto_Detect	GW_Plan_Name	GW_Reps_Performed	GW_Rounds_Performed	
		  Golf_Course_Name	Golf_Course_Par	Golf_Total_Score	Golf_Par_or_Better	Golf_Pace_of_Play_Minutes	
		  Golf_Longest_Drive_Yards;
run;

data health.activity; /* 8c */
	length Event_Type	$10. Cardio_Benefit $12. Sleep_Restoration $8. Sleep_Auto_Detect $6. ;
	infile "W:\My Documents\SAS Project\Activity.csv" dlm=',' dsd missover;
	input Input_Date :mmddyy9. Start_Time :time. Event_Type :$10.	Duration_Seconds :7. Seconds_Paused	Calories_Burned	
		  Calories_Burned_Carbs	Calories_Burned_Fats	HR_Lowest	HR_Peak	HR_Average	
		  UV_Exposure_Minutes	Total_Kilometers_Moved	Cardio_Benefit	Minutes_Under_50_HR	
		  Minutes_In_HRZ_Very_Light_50_60	Minutes_In_HRZ_Light_60_70	
		  Minutes_In_HRZ_Moderate_70_80	Minutes_In_HRZ_Hard_80_90	Minutes_In_HRZ_Very_Hard_90_Plus	
		  HR_Finish	HR_Recovery_Rate_1_Min	HR_Recovery_Rate_2_Min	Recovery_Time_Seconds	Bike_Average_KPH	
		  Bike_Max_KPH	Elevation_Highest_Meters	Elevation_Lowest_Meters	Elevation_Gain_Meters	
		  Elevation_Loss_Meters	Wake_Up_Time :MDYAMPM20.2	Seconds_Awake	Seconds_Asleep_Total	Seconds_Asleep_Restful	
		  Seconds_Asleep_Light	Wake_Ups	Seconds_to_Fall_Asleep	Sleep_Efficiency	Sleep_Restoration	
		  Sleep_HR_Resting	Sleep_Auto_Detect	GW_Plan_Name	GW_Reps_Performed	GW_Rounds_Performed	
		  Golf_Course_Name	Golf_Course_Par	Golf_Total_Score	Golf_Par_or_Better	Golf_Pace_of_Play_Minutes	
		  Golf_Longest_Drive_Yards;
		  Sleep_Efficiency = Sleep_Efficiency/100; 
	format Input_Date date9. Sleep_Efficiency percent8.2 ;
run;

proc contents data=health.activity;
run;

proc print data=health.activity; /* 8d */
	format Start_Time hhmm8.2 Wake_Up_Time MDYAMPM20.2;
run;

/* 3. Print SAS data set(s) using:
	a)	Proc PRINT
	b)	SPLIT= option
	c)	TITLE
	d)	FOOTNOTE
*/

PROC IMPORT OUT= HEALTH.Daily 
            DATAFILE= "W:\My Documents\SAS Project\Microsoft_Health_2015
0418_20150831.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="'Daily summary$'"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

proc print data=health.Daily ; /* 3a */
run;

proc print data=health.Daily Split="_"; /* 3b */
run;


title "Sneha's Daily Activity"; /* 3c */
proc print data=health.Daily Split="_"; 
run;

title ; 
footnote "Data from Sneha's Health Band"; /* 3d */
proc print data=health.Daily Split="_"; 
run;

/* 12. Merge two or more data sets—at least two different merges must be done
	a)	One must have non-matches
	(1)	Use IN= options with a IF conditional statement
	(2)	Direct output to 2 different datasets (matches and non-matches)
	b)	One must use the options below
	(1)	RENAME=   
	(2)	DROP=/KEEP= options 
*/

/* both datasets are already sorted by Input_Date */
data matches nonmatches(drop=Calories_Burned HR_Peak) ; /* 12a */
	merge health.activity (in=a) health.daily (rename= (Date=Input_Date)in=d) ;
	by Input_Date;
	if (a=1 and d=1 ) then output matches;
	else output nonmatches;
	keep Input_Date Calories_Burned HR_Peak;
run;

data merged (keep= Input_Date Duration_Seconds Calories_Burned Total_Kilometers_Moved ); /* 12b */
	merge health.activity (rename=(Seconds_Paused=Pause_Time_Sec) in=a) health.daily (rename= (Date=Input_Date)in=d) ;
	by Input_Date;
run;

/* 15. Demonstrate the following
	a)	Use of RETAIN
	b)	Sum Statement (variable + expression;)
	c)	Use of FIRST. and LAST.
	d)	Proc SORT
*/

data total; /* 15a */
	set health.activity;
	retain Total_Calories_Burned 0;
	Total_Calories_Burned = Total_Calories_Burned + Calories_Burned;
	keep Input_Date Calories_Burned Total_Calories_Burned;
run;

data total_to_date; /* 15b */
	set health.activity;
	Total_Calories_Burned + Calories_Burned;
	keep Input_Date Calories_Burned Total_Calories_Burned;
run;

proc sort data=health.activity /* 15d */
	out=activity;
	by Event_Type Cardio_Benefit;
run;

data aggregate; /* 15c */
	set activity;
	by Event_Type Cardio_Benefit;
	if first.Event_Type then Calorie_Count = 0;
	else Calorie_Count + Calories_Burned;
	if last.Cardio_Benefit then output;
run;

/* 21. Converting Variable Type
	a)	Character to Numeric
	b)	Numeric to Character
	c)	Demonstrate automatic conversion (need log here)
	d)	Proc CONTENTS showing the original variable type
*/ 

data health.conversion; /* 21b */
	set health.daily (rename=(Steps=numSteps Total_Kilometers_Moved=numTLM));
	Steps = put(numSteps,5.);
	Total_Kilometers_Moved = put(numTLM, 10.2);
	keep Date Steps Total_Kilometers_Moved;
run;

data health.toNum (drop=charSteps charTLM); /* 21a */
	set health.conversion (rename=(Steps=charSteps Total_Kilometers_Moved=charTLM));
	Steps=input(charSteps,5.);
	Total_Kilometers_Moved=input(charTLM,10.2);
run;

data health.autoconversion; /* 21c */
	set health.conversion;
	Meters_Moved = Total_Kilometers_Moved * 1000;
run;

proc contents data=health.conversion; /* 21d */
run;


/* 18. Use the following fuctions
	a)	SUBSTR
	b)	LENGTH
	c)	SCAN
	d)	PROPCASE
	e)	One of (RIGHT, LEFT, UPCASE, LOWCASE, CHAR)
	f)	CATX (or CAT, CATS, CATT)
*/

data health.functions;
	set health.activity;
	length Status $40.;
	if (Cardio_Benefit = ' ') then Status = "Lazy Sneha did not workout today!";
	else do;
		select (substr(Cardio_Benefit,1,1)); /* 18a */
		when ('M') Status = "Sneha worked out pretty well";
		when ('L') Status = "Sneha can push herself to do better";
		otherwise Status = "Error";
		end;
	end;
	keep Input_Date Cardio_Benefit Status;
run;

data health.functions;
	set health.activity;
	length Emoticon $11.;
	if (length(Event_Type)>5 or length(Event_Type)<4) then Emoticon = "Thumbs Up"; /* 18b */
	else Emoticon = "Thumbs Down";
	keep Event_Type Emoticon;
run;

data health.functions2;
	set health.functions;
	UporDown = scan(Emoticon,2); /* 18c */
	Keep Event_Type UporDown;
run;

data health.functions3;
	set health.functions;
	low = lowcase(Event_Type); /* 18d */
	proper = propcase(low);   /* 18e */
	Keep Event_Type low proper;
run;

data health.functions4;
	set health.activity;
	Description = catx("-",Event_Type,Cardio_Benefit); /* 18f */
	keep Input_Date Description;
run;


/* 20. Use the following functions
	a)	ROUND
	b)	One of (CEIL, FLOOR, INT)
	c)	One of (SUM, MEAN)
	d)	One of (MIN, MAX, N)
	e)	One of (NMISS, CMISS)
*/

data health.math;
	set health.daily;
	Kilometers_Moved = round(Total_Kilometers_Moved,0.1); /* 20a */
	keep Date Kilometers_Moved;
run;

data health.math2;
	set health.daily;
	Max_Kilometers_Moved = ceil(Total_Kilometers_Moved); /* 20b */
	keep Date Max_Kilometers_Moved;
run;

data health.math3;
	set health.activity;
	total_calories_burned = sum(Calories_Burned_Carbs,Calories_Burned_Fats);  /* 20c */
	average_calories_burned = mean(Calories_Burned_Carbs,Calories_Burned_Fats);
	keep Input_Date total_calories_burned average_calories_burned;
run;

data health.math4;
	set health.activity;
	min_heart_rate= min(HR_Lowest,HR_Average,HR_Finish); /* 20d */
	keep Input_Date min_heart_rate;
run;

data health.math5;
	set health.activity;
	number_of_missing_hr = nmiss (HR_Lowest,HR_peak,HR_Average,HR_Finish); /* 20e */
	keep Input_Date number_of_missing_hr; 
run;


/* 25. Demonstrate the following:
	a)	OPTIONS SYMBOLGEN
	b)	%put
	c)	%let: Create and use at least three user macro variables
	d)	Use at least three automatic macro Variables
	e)	%SYMDEL
*/

options symbolgen; /* 25a */

%put Health Data Captured from MS Band ; /* 25b */

%let a = Run; /* 25c */
%let b = 20000;
%let c = Good;

title "&a Activity";

proc print data=health.activity;
where Event_Type contains "&a";
run;

title;
proc print data=health.activity;
where Duration_Seconds > &b ;
run;

proc print data=health.activity;
where Sleep_Restoration = "&c" ;
run;

/* 25d */
%put Date is &sysdate ;

%put Last dataset &SYSLAST;

%put Who is working on SAS? &sysuserid;

%symdel a b c; /* 25e */

/* 27. Write and call at least two macro programs (different from those in another topic) using:
	a)	%MACRO
	b)	%MEND
	c)	OPTIONS MPRINT;
	d)	OPTIONS MCOMPILENOTE=ALL
*/

options mcompilenote = all; /* 27d */
%macro daily(day); /* 27a */
	proc print data=health.daily;
		where date = &day;
	run;
%mend; /* 27b */

options mprint; /* 27c */
%daily('29APR2015'd);

%macro daily(day); /* 27a */
	proc print data=health.daily;
		where date = &day;
	run;
%mend; /* 27b */

%macro sleep_efficiency(wake_ups); /* 27a */
	proc print data=health.activity;
		where Wake_Ups > &wake_ups ;
		var Input_Date Wake_Ups Seconds_Awake Seconds_Asleep_Total Seconds_Asleep_Restful Seconds_Asleep_Light Sleep_Efficiency;
	run;
%mend; /* 27b */

%sleep_efficiency(3);



/* 14. Demonstrate the following
	a)	SELECT group 
	b)	Explicit output to multiple datasets
	c)	DROP=/KEEP= options in data statement
	d)	FIRSTOBS= and OBS=
*/

data Sleep (keep= Wake_Up_Time	Seconds_Awake	Seconds_Asleep_Total
					Seconds_Asleep_Restful	Seconds_Asleep_Light	
					Wake_Ups	Seconds_to_Fall_Asleep	Sleep_Efficiency	
					Sleep_Restoration	Sleep_HR_Resting	Sleep_Auto_Detect) /* 14c */
	Run (keep= Duration_Seconds Calories_Burned Total_Kilometers_Moved ) 
	Exercise (keep= Start_Time	Event_Type	Duration_Seconds	
					Seconds_Paused	Calories_Burned	Calories_Burned_Carbs	Calories_Burned_Fats	
					HR_Lowest	HR_Peak	HR_Average	UV_Exposure_Minutes	Cardio_Benefit) 
	Errored;
	set health.activity;
	select(Event_Type); /* 14 a */
		when ('Exercise') output Exercise; /* 14b */
		when ('Sleep') output Sleep;
		when ('Run') output Run;
		otherwise output Errored;
	end;
run;

title;

proc print data=work.Exercise (firstobs=5 obs=20); /* 14d */
run;

/*9. Demonstrate the following
	a)	Creating new variables 
	b)	Usage of two of (YEAR, QTR, MONTH, DAY, WEEKDAY)
	c)	TODAY()
	d)	MDY()
*/

data health.dateuse;
	set health.activity end=final;
	Birthday = mdy(03,30,1991); /* 9d */ 
	call symputx('bdy',put(Birthday,mmddyy10.));
	Year = year(Input_date); /* 9a */
	Month = month(Input_date); /* 9b */
	how_long_ago = today() - input_date; /* 9c */
	total_calories_burned + calories_burned;	
	if final then call symputx('tcb',total_calories_burned);
	keep Input_Date Year Month how_long_ago;	 
run;

footnote "Total Caloried Burned while working out : &tcb";
footnote2 "Sneha has her birthday on : &bdy";
proc print data=health.dateuse;
run;

