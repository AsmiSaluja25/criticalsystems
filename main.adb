pragma SPARK_Mode (On);

with AS_Io_Wrapper; use AS_Io_Wrapper;
with days; use days;

procedure main is
   Input : String (1..10);
   Last, Day: Integer;
   Success: Boolean;
   Month : days.Months;
   Dates : days.Date;
   Result_Func, Result_Proc : days.days_in_Year;
   Continue : String (1..1);
begin
   AS_Init_Standard_Input;
   AS_Init_Standard_Output;
   loop
         --months loop
      loop 

         AS_Put_Line("Enter month: ");
         AS_Get_Line(Input, Last); 
         
         if Last > Input'Last then
             Last := Input'Last;
         end if;

         --Last checks input length
         pragma Assert (Last <= Input'Last);


         days.parse_Months(Input (1.. Last), Month, Success);
         
         exit when Success;
         AS_Put_Line("Please enter a valid month: ");
         
      end loop;


         
         --days loop
      loop
           
            AS_Put_Line("Enter day: ");
            AS_Get(Day);
         
         if days.valid_Date(Month, Day)
           then exit;
         else
            exit when days.valid_Date(Month, Day);
            AS_Put_Line("Invalid day. Try again: ");
         end if;
         
      end loop;

      
      Dates.Month := Month;
      Dates.Day := days.days_in_Months(Day);

       pragma Assert(Dates.Day in 1 .. Month_Max_days(Dates.Month));
       Result_Func := days.compute_day_year(Dates);
       days.compute_day_year_second(Dates, Result_Proc);
      
      AS_Put("Month: " );
      AS_Put(days.enum_to_string(Dates.Month));
      AS_Put_Line;
      AS_Put("Day of year: ");
      AS_Put(Result_Func);
      AS_Put_Line;
      AS_Put("Day of year: ");
      AS_Put(Result_Proc);
      AS_Put_Line;
      
         
         AS_Put("Do you want to continue? y or n: ");
         AS_Get(Continue);
         AS_Skip_Line;
         exit when Continue = "n" or else Continue = "N";
      end loop;
      
   
end main;
