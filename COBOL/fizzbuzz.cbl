       IDENTIFICATION DIVISION.
       PROGRAM-ID. cobuzz. 
       AUTHOR. Maya Copeland.
       ENVIRONMENT DIVISION.
       DATA DIVISION. 
           WORKING-STORAGE SECTION.
           01 CONFIG.
               03 MAX-BUZZ PIC 9(4) VALUE 1000.                      
               03 FIZZ PIC 9 VALUE 3.
               03 BUZZ PIC 9 VALUE 5.
               03 FIZZ-BUZZ PIC 9(2) VALUE 15.
           01 INCREMENT PIC 9(4) VALUE 1.

       PROCEDURE DIVISION.
           PERFORM GET-BUZZ MAX-BUZZ TIMES.

           GET-BUZZ.                               
               IF FUNCTION MOD (INCREMENT, FIZZ-BUZZ) = 0  
                   DISPLAY "FizzBuzz"   
               ELSE IF FUNCTION MOD (INCREMENT, FIZZ) = 0  
                   DISPLAY "Fizz" 
               ELSE IF FUNCTION MOD (INCREMENT, BUZZ) = 0  
                   DISPLAY "Buzz"  
               ELSE
                   DISPLAY INCREMENT                       
               END-IF.
               COMPUTE INCREMENT = INCREMENT + 1.
                                                                 
