pragma SPARK_Mode;

package ventilator is

   subtype oxygen_percent is Integer range 21..100;
   subtype breath_rate is Integer range 5..40;
   subtype airway_press is Integer range 5..40;
   subtype tidal_vol is Integer range 300..1000;  
   
   type alert_status is(safe, warning, critical);

   
   min_oxygen : Constant oxygen_percent := 40;
   max_oxygen : Constant oxygen_percent := 80;
   min_breath_rate : Constant breath_rate:= 12;
   max_breath_rate : Constant breath_rate:= 20;
   min_tidal_range : Constant tidal_vol:= 400;
   max_tidal_range : Constant tidal_vol:= 800;
   min_air_press : Constant airway_press := 10;
   max_air_pres : Constant airway_press:=30;
   
   min_oxygen_warn : Constant oxygen_percent:= 30;
   min_breath_warn : Constant breath_rate := 8;
   max_breath_warn : Constant breath_rate := 35;
   min_tidal_warn : Constant tidal_vol:= 350;
   max_tidal_warn : Constant tidal_vol:= 600;
   max_air_warn : Constant airway_press:=35;
   
   function check_oxygen_stat(oxygen: oxygen_percent) return alert_status
     with
       Global => null,
       Depends => (check_oxygen_stat'Result => oxygen),
       Pre => oxygen in oxygen_percent,
       Post => (if oxygen >= min_oxygen and oxygen <= max_oxygen then check_oxygen_stat'Result = safe
      elsif oxygen >= min_oxygen_warn then check_oxygen_stat'Result = warning
      else check_oxygen_stat'Result = critical);
      
   
   function check_breath_rate(breath: breath_rate) return alert_status
     with 
       Global => null,
       Depends => (check_breath_rate'Result => breath),
       Pre => breath in breath_rate,
       Post => (if breath >= min_breath_rate and breath <= max_breath_rate then check_breath_rate'Result = safe
      elsif breath >= min_breath_warn and breath <= max_breath_warn then  check_breath_rate'Result = warning
      else check_breath_rate'Result =critical);
   
   function check_tidal_vol(tidal: tidal_vol) return alert_status
     with 
       Global => null,
       Depends => (check_tidal_vol'Result => tidal),
       Pre => tidal in tidal_vol,
       Post => (if tidal >= min_tidal_range and tidal <= max_tidal_range then check_tidal_vol'Result = safe
       elsif tidal >= min_tidal_warn and tidal <= max_tidal_warn then check_tidal_vol'Result = warning
       else check_tidal_vol'Result = critical);
   
   function check_air_press(airway: airway_press) return alert_status
     with 
       Global => null,
       Depends => (check_air_press'Result => airway),
       Pre => airway in airway_press,
       Post => (if airway >= min_air_press and airway <= max_air_pres then check_air_press'Result = safe
        elsif airway <= max_air_warn then check_air_press'Result = warning
        else check_air_press'Result = critical);
   
   
   procedure display_stat(status : alert_status; param_name : string)
    with
       --Global => null,
       Pre => (param_name'Length > 0);
   
end ventilator;
