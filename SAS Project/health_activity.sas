PROC IMPORT OUT= WORK.Activity 
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
