pragma SPARK_Mode (On);

with AS_Io_Wrapper; use AS_Io_Wrapper;
with euclidean; use euclidean;


procedure Main is
   A, B, G, Gb, Ga: Integer;
   Continue : String (1..1);

   
begin
   AS_Init_Standard_Input;
   AS_Init_Standard_Output;
  
      
   loop
      --get integers loop
      loop
         AS_Put_Line("Enter two positive integers: ");
         AS_Get(A);
         AS_Get(B);
         
         --checking values of A + B
         exit when A > 0 and B > 0 and A<=10000 and B <=10000;
         if A <= 0 or else B <= 0 then
            AS_Put_Line("Both numbers must be positive");
         end if;

      end loop;
   

      euclidean.compute_eu(A, B, G, Ga, Gb);
      AS_Put("Greatest Common Divisor is:");
      AS_Put(G);
      AS_Put_Line;
      AS_Put("Ga =");
      AS_Put(Ga);
      AS_Put_Line;
      AS_Put("Gb =");
      AS_Put(Gb);
      AS_Put_Line;
   
      AS_Put_Line("Do you want to continue? y or n: ");
      AS_Get(Continue);
      AS_Skip_Line;
      exit when Continue = "n" or else Continue = "N";
      
   end loop;
   
end Main;
