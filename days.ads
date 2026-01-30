pragma SPARK_Mode;

package days is
   
   --enum
   type Months is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
   
   subtype days_in_Months is Integer range 1..31;
   subtype days_in_Year is Integer range 1..365;
   subtype days_Before_range is Integer range 0..334;
   
   Month_Start: constant array(Months) of days_Before_range:=
     (Jan => 0,
      Feb => 31,
      Mar => 59,
      Apr => 90,
      May => 120,
      Jun => 151,
      Jul => 181,
      Aug => 212,
      Sep => 243,
      Oct => 273,
      Nov => 304,
      Dec => 334);
   
   Month_Max_days : constant array (Months) of days_in_Months :=
        (Jan => 31,
         Feb => 28,
         Mar => 31,
         Apr => 30,
         May => 31,
         Jun => 30,
         Jul => 31,
         Aug => 31,
         Sep => 30,
         Oct => 31,
         Nov => 30,
         Dec => 31);

   type Date is record
      Month: Months;
      Day: days_in_Months;
   end record;
   
   function days_before_func(Month : Months) return days_Before_range
     with
       Global => null,
       Depends => (days_before_func'Result => Month);
   
   function compute_day_year(Dates : Date) return days_in_Year
     with 
       Global => null,
       Depends => (compute_day_year'Result => Dates),
       Pre => Dates.Day in 1..Month_Max_days(Dates.Month), 
       Post => compute_day_year'Result = Month_Start(Dates.Month) + Dates.Day;
       
   procedure compute_day_year_second (Dates : Date; Result : out days_in_Year)
     with
       Global => null,
       Depends => (Result => Dates),
       Pre => Dates.Day in 1..Month_Max_days(Dates.Month),
       Post => Result = Month_Start(Dates.Month) + Dates.Day;
  
   
   function enum_to_string(Month : Months) return String
     with Global => null, 
     Depends => (enum_to_string'Result => Month);
   
   procedure parse_Months (Input : String; Month : out Months; Success : out Boolean)
     with Global => null, 
     Depends => (Month => (Input),
                 Success => (Input));
   
   function valid_Date(Month : Months; Day: Integer) return Boolean
     with Global => null, 
     Depends => (valid_Date'Result => (Month, Day));
   
   function valid_Date (Month : Months; Day: Integer) return Boolean is
      (Day >= 1 and Day <= Month_Max_Days(Month));
   
  end days;
