
pragma SPARK_Mode;

package body days is
   
   function days_before_func (Month : Months) return days_Before_range is
   begin
      case Month is
         when Jan => return 0;
         when Feb => return 31;
         when Mar => return 31 + 28;
         when Apr => return 31 + 28 +31;
         when May => return 31 + 28 +31 + 30;
         when Jun => return 31 + 28 +31 + 30 + 31;
         when Jul => return 31 + 28 +31 + 30 + 31 +30;
         when Aug => return 31 + 28 +31 + 30 + 31 +30 +31;
         when Sep => return 31 + 28 +31 + 30 + 31 +30 +31 +31;
         when Oct => return 31 + 28 +31 + 30 + 31 +30 +31 +31 +30;
         when Nov => return 31 + 28 +31 + 30 + 31 +30 +31 +31 +30 +31;
         when Dec => return 31 + 28 +31 + 30 + 31 +30 +31 +31 +30 +31 +30;
      end case;
   end days_before_func;
   
   
   function compute_day_year(Dates:Date) return days_in_Year is
   begin           
      return days_in_Year (Month_Start (Dates.Month) + Dates.Day);
   end compute_day_year;

    
    procedure compute_day_year_second (Dates : Date; Result : out days_in_Year) is                     
      begin               
      Result := Month_Start(Dates.Month) + Dates.Day;
   end compute_day_year_second;
   
   function enum_to_string (Month : Months) return String is
   begin
      case Month is 
         when Jan => return "January";
         when Feb => return "Febuary";
         when Mar => return "March";
         when Apr => return "April";
         when May => return "May";
         when Jun => return "June";
         when Jul => return "July";
         when Aug => return "August";
         when Sep => return "September";
         when Oct => return "October";
         when Nov => return "Novemvber";
         when Dec => return "December";
      end case;
   end enum_to_string;
   
   procedure parse_Months (Input : String; Month : out Months; Success: out Boolean) is
      --Lower : String (1 .. Input'Length) := Input;
      --Lower here did not have the same index range as input
      --if the input range was changed somewhere else in the code, there would 
      --be a missmatch between lower and input
      Lower : String (Input'Range);

   begin
      --default value
      Month := JAN;
      for i in Input'Range loop
         if Input(i) in 'A'..'Z' then
            Lower(i) := Character'val(Character'Pos(Input(i)) + 32);
            --converting input string character by character by comparing upper
            --and lower cases through ascii values
            --after checking if inputs are within uppsercase in input range
         else
            --otherwise take the input as is
            Lower(i) := Input(i);
         end if;
      end loop; 
      
      if Lower = "jan" then Month := Jan; Success := True;
      elsif Lower = "feb" then Month := Feb; Success := True;
      elsif Lower = "mar" then Month := Mar; Success := True;
      elsif Lower = "apr" then Month := Apr; Success := True;
      elsif Lower = "may" then Month := May; Success := True;
      elsif Lower = "jun" then Month := Jun; Success := True;
      elsif Lower = "jul" then Month := Jul; Success := True;
      elsif Lower = "aug" then Month := Aug; Success := True;
      elsif Lower = "sep" then Month := Sep; Success := True;
      elsif Lower = "oct" then Month := Oct; Success := True;
      elsif Lower = "nov" then Month := Nov; Success := True;
      elsif Lower = "dec" then Month := Dec; Success := True;
      else
         Success := False;
            end if;


   end parse_Months;
   
 end days;
