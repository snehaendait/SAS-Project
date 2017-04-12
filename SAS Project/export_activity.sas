PROC EXPORT DATA= WORK.ACTIVITY 
            OUTFILE= "W:\My Documents\SAS Project\exported.xls" 
            DBMS=EXCEL REPLACE;
     SHEET="activity"; 
RUN;
