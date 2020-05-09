Potentially useful dosubl interface                                                                                              
                                                                                                                                 
github                                                                                                                           
https://tinyurl.com/y8lf5n8g                                                                                                     
https://github.com/rogerjdeangelis/utl-potentially-useful-dosubl-interface                                                       
                                                                                                                                 
Dumb Example                                                                                                                     
Calculate the mean deviation for Height and Weight                                                                               
                                                                                                                                 
Mnay languages require strong typing. This algolrithm                                                                            
requires typing and a 0 observation table structure.                                                                             
It also uses open=defer to delay opening the a tables                                                                            
created by dosubl.                                                                                                               
                                                                                                                                 
*_                   _                                                                                                           
(_)_ __  _ __  _   _| |_                                                                                                         
| | '_ \| '_ \| | | | __|                                                                                                        
| | | | | |_) | |_| | |_                                                                                                         
|_|_| |_| .__/ \__,_|\__|                                                                                                        
        |_|                                                                                                                      
;                                                                                                                                
                                                                                                                                 
data class;                                                                                                                      
  set sashelp.class;                                                                                                             
run;quit;                                                                                                                        
                                                                                                                                 
/*                                                                                                                               
Up to 40 obs WORK.CLASS total obs=19                                                                                             
                                                                                                                                 
Obs    NAME       SEX    AGE    HEIGHT    WEIGHT                                                                                 
                                                                                                                                 
  1    Joyce       F      11     51.3       50.5                                                                                 
  2    Louise      F      12     56.3       77.0                                                                                 
  3    Alice       F      13     56.5       84.0                                                                                 
  4    James       M      12     57.3       83.0                                                                                 
  5    Thomas      M      11     57.5       85.0                                                                                 
...                                                                                                                              
*/                                                                                                                               
                                                                                                                                 
*            _               _                                                                                                   
  ___  _   _| |_ _ __  _   _| |_                                                                                                 
 / _ \| | | | __| '_ \| | | | __|                                                                                                
| (_) | |_| | |_| |_) | |_| | |_                                                                                                 
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                
                |_|                                                                                                              
;                                                                                                                                
                                                                                                                                 
Up to 40 obs WORK.WANT total obs=19                                                                                              
                                                                                                                                 
                                    Added Variables              Added Variables                                                 
                                   =================           ===================                                               
   NAME      SEX    AGE    HEIGHT  AVGHGT  AVGDIFHGT   WEIGHT  AVGWGT    AVGDIFWGT   Mean deviation                              
                                                                                                                                 
  Joyce       F      11     51.3     62.3   -11.0368     50.5  100.03    -49.5263  * 50.5 - 100.03 = -49.53                      
  Louise      F      12     56.3     62.3    -6.0368     77.0  100.03    -23.0263                                                
  Alice       F      13     56.5     62.3    -5.8368     84.0  100.03    -16.0263                                                
  James       M      12     57.3     62.3    -5.0368     83.0  100.03    -17.0263                                                
  Thomas      M      11     57.5     62.3    -4.8368     85.0  100.03    -15.0263                                                
  John        M      12     59.0     62.3    -3.3368     99.5  100.03     -0.5263                                                
  Jane        F      12     59.8     62.3    -2.5368     84.5  100.03    -15.5263                                                
  Janet       F      15     62.5     62.3     0.1632    112.5  100.03     12.4737                                                
  Jeffrey     M      13     62.5     62.3     0.1632     84.0  100.03    -16.0263                                                
  Carol       F      14     62.8     62.3     0.4632    102.5  100.03      2.4737                                                
  Henry       M      14     63.5     62.3     1.1632    102.5  100.03      2.4737                                                
  Judy        F      14     64.3     62.3     1.9632     90.0  100.03    -10.0263                                                
  Robert      M      12     64.8     62.3     2.4632    128.0  100.03     27.9737                                                
  Barbara     F      13     65.3     62.3     2.9632     98.0  100.03     -2.0263                                                
  Mary        F      15     66.5     62.3     4.1632    112.0  100.03     11.9737                                                
  William     M      15     66.5     62.3     4.1632    112.0  100.03     11.9737                                                
  Ronald      M      15     67.0     62.3     4.6632    133.0  100.03     32.9737                                                
  Alfred      M      14     69.0     62.3     6.6632    112.5  100.03     12.4737                                                
  Philip      M      16     72.0     62.3     9.6632    150.0  100.03     49.9737                                                
                                                                                                                                 
*                                                                                                                                
 _ __  _ __ ___   ___ ___  ___ ___                                                                                               
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                              
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                              
| .__/|_|  \___/ \___\___||___/___/                                                                                              
|_|                                                                                                                              
;                                                                                                                                
                                                                                                                                 
* in case you rerun;                                                                                                             
proc datasets lib=work;                                                                                                          
  delete class avgAdd allocate;                                                                                                  
run;quit;                                                                                                                        
                                                                                                                                 
* make input data;                                                                                                               
data class;                                                                                                                      
  set sashelp.class;                                                                                                             
run;quit;                                                                                                                        
                                                                                                                                 
data want;                                                                                                                       
                                                                                                                                 
    * Declare the extra variables. Note 0 observations;                                                                          
    if _n_=0 then do;%dosubl('                                                                                                   
        data allocate;                                                                                                           
           attrib                                                                                                                
             avgHgt length=8 label="Average Height"                                                                              
             avgWgt length=8 label="Average Weight"                                                                              
            ;                                                                                                                    
           set class;                                                                                                            
           stop;                                                                                                                 
        run;quit;                                                                                                                
        ');                                                                                                                      
    end;                                                                                                                         
                                                                                                                                 
    * calculate means;                                                                                                           
    if _n_=1 then do;                                                                                                            
      rc=dosubl('                                                                                                                
         proc sql;                                                                                                               
            create                                                                                                               
                table avgAdd as                                                                                                  
            select                                                                                                               
                *                                                                                                                
               ,mean(height) as avgHgt                                                                                           
               ,mean(weight) as avgWgt                                                                                           
            from                                                                                                                 
               class                                                                                                             
         ;quit;                                                                                                                  
         ');                                                                                                                     
    end;                                                                                                                         
                                                                                                                                 
    * allocate is just a empty table structure;                                                                                  
    * the comilier defers avgAdd after the table structure is read in;                                                           
                                                                                                                                 
    set allocate avgAdd open=defer;                                                                                              
                                                                                                                                 
    avgDifWgt=weight-avgWgt;                                                                                                     
    avgDifHgt=height-avgHgt;                                                                                                     
                                                                                                                                 
    drop rc;                                                                                                                     
                                                                                                                                 
run;quit;                                                                                                                        
                                                                                                                                 
