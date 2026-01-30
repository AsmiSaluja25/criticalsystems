pragma SPARK_Mode;
with AS_Io_Wrapper; use AS_Io_Wrapper;
package body euclidean is

   
   subtype Const_Int is Integer range 0 .. 10000;
   
   procedure compute_eu (A, B: in Integer; G, Ga, Gb : out Integer) is
      R : Const_Int := A;
      S : Const_Int := B;
      
      --coefficients
      Ra, Sb : Const_Int := 1; --coeff A in R + B in S
      Rb, Sa : Const_Int := 0; --coeff B in R + A in S
      
      D, R1, S1: Const_Int;

      
   begin
      while R /= 0 and S/= 0
      loop
         pragma Loop_Invariant(
                            A = R * Ra + S * Sa
                               and B = R * Rb + S * Sb
                               and R > 0 
                               and S > 0 
                               and R <= A
                               and Ra >= -A and Ra <= A
                            and Rb >= -B and Rb <= B
                            and Sa >= -A and Sa <= A
                            and Sb >= -B and Sb <= B  
                              and S <= B);
                              
         if R > S then 
            D := R/ S;
            R1 := R mod S;
            
            Sa := D * Ra + Sa;
            Sb := D * rb + sb;

            R := R1;
         else
            D := S/R;
            S1 := S mod R;
            
          pragma Assert (S = D * R + S1);
          
            Ra := Ra + D * Sa;
            Rb := Rb + D *Sb;
            S := S1;
         end if;
         
      end loop;
      
      if R = 0 then
         G:= S;
         Ga := Sa;
         Gb := Sb;
         
         pragma Assert (S>0);
         
      else
         G := R;
         Ga := Ra;
         Gb := Rb;
         pragma Assert(R>0);
      end if;
      
      pragma Assert (A = G * Ga);
      pragma Assert (B = G * Gb);
      
   end compute_eu;
   
end euclidean;
