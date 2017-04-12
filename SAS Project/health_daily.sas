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
