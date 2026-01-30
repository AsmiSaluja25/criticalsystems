pragma SPARK_Mode;
with AS_Io_Wrapper; use AS_Io_Wrapper;

package body ventilator is
   
   function check_oxygen_stat(oxygen: oxygen_percent) return alert_status is
   begin 
      if oxygen >= min_oxygen and oxygen <= max_oxygen then
         return safe;
      elsif oxygen >= min_oxygen_warn then
            return warning;
      else 
            return critical;
      end if;
   end check_oxygen_stat;
         
   
   function check_breath_rate(breath: breath_rate) return alert_status is 
   begin
      if breath >= min_breath_rate and breath <= max_breath_rate then
            return safe;
      elsif breath >= min_breath_warn and breath <= max_breath_warn then 
            return warning;
      else
            return critical;
      end if;
   end check_breath_rate;
   
   function check_tidal_vol(tidal: tidal_vol) return alert_status is 
   begin
       if tidal >= min_tidal_range and tidal <= max_tidal_range then
             return safe;
       elsif tidal >= min_tidal_warn and tidal <= max_tidal_warn then
             return warning;
       else 
             return critical;
       end if;
   end check_tidal_vol;
   
   function check_air_press(airway: airway_press) return alert_status is
   begin
        if airway >= min_air_press and airway <= max_air_pres then
              return safe;
        elsif airway <= max_air_warn then
              return warning;
        else 
         return critical;
      end if;
   end check_air_press;
               
   
   procedure display_stat(status : alert_status; param_name : string) is
   begin
      --pragma Assert(param_name := String);
      --pragma Assert(param_name'Length <= 30);
      AS_Put(param_name);
      AS_Put(" : ");
      if status = safe then
         AS_Put_Line("Safe");
      elsif status = warning then
         AS_Put_Line("Warning, Shutdown Recommended");
      else
         AS_Put_Line("Critical, Emergency Shutdown");
      end if;
   end display_stat;
   
     

end ventilator;
