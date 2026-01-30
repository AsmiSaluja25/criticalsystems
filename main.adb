pragma SPARK_Mode;


with AS_Io_Wrapper; use AS_Io_Wrapper;
with ventilator; use ventilator;

procedure main is
   Input, Continue : String(1..1);
   oxy_value, breath_value, tidal_value, air_value : Integer;
   
     
begin
   AS_Init_Standard_Input;
   AS_Init_Standard_Output;
   --main loop
   loop
      
      --asks to start ventilator
      loop
         AS_Put("Start Ventilator? ");
         AS_Get(Input);
         exit when input = "y" or else input = "Y";
         
      end loop;
      --end of start ventilator loop

      --entering main loop
      AS_Put_Line("Safe Ranges: ");
      AS_Put_Line("Oxygen : 21-100%. Ideal Range is 40-80%.");
      AS_Put_Line("Breath Rate : 5-40 BPM. Ideal Range is 12-20 BPM.");
      AS_Put_Line("Tidal Volume : 300-1000ML. Ideal Range is 400-800ML."); --amount of air in/exhale
      AS_Put_Line("Airway Press : 5-40. Ideal Range is 10-30.");
      
      loop
      AS_Put("Enter Oxygen Level: ");
      AS_Get(oxy_value);
         
         
         if oxy_value >= 21 and oxy_value <= 100
         then exit;
         else 
            exit when  oxy_value >= 21 and oxy_value <= 100;
              AS_Put_Line("Oxygen level must be between 21 and 100");
         
       end if;       
      end loop;
      --valid_oxygen := is_valid_oxygen(current_oxygen);
      
      loop
         AS_Put("Enter Breathing Rate: ");
         AS_Get(breath_value);
      
         if breath_value >= 5 and breath_value <= 40 then
            exit;
         else
            exit when breath_value >= 5 and breath_value <= 40;
         AS_Put_Line("Breathing rate must be between 5 and 40");
         end if;
      end loop;
      
         loop
         AS_Put("Enter Tidal Volume: ");
         AS_Get(tidal_value);
      
         if tidal_value >= 300 and tidal_value <= 1000 then
            exit;
         else
            exit when tidal_value >= 300 and tidal_value <= 1000;
         AS_Put_Line("Tidal Volume must be between 300 and 1000");
         end if;
         
      end loop;
      
loop
         AS_Put("Enter Air Pressure: ");
         AS_Get(air_value);
      
         if air_value >= 5 and air_value <= 40 then
            exit;
         else
exit when air_value >= 5 and air_value <= 40;
         AS_Put_Line("Air Pressure must be between 5 and 40");
         end if;

       end loop;
      
      display_stat(check_oxygen_stat(oxy_value), "Oxygen Status");
      display_stat(check_breath_rate(breath_value), "Breathing Rate Status");
      display_stat(check_tidal_vol(tidal_value), "Tidal Volume Status");
      display_stat(check_air_press(air_value), "Air Pressure Status");
      
      AS_Put("Do you want to continue? y or n: ");
         AS_Get(Continue);
         AS_Skip_Line;
         exit when Continue = "n" or else Continue = "N";
      
   end loop;
end main;
