pragma SPARK_Mode;

package euclidean is

   
   procedure compute_eu (A, B : in Integer; G, Ga, Gb : out Integer)
     with 
       Global => null, 
       pre => A > 0 and A <= 10000 and B >0 and B <= 10000,
       post => G > 0 and A = G * Ga and B = G * Gb;
       
end euclidean;
