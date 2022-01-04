#include	"colors.inc"		
#include	"textures.inc"	
#include	"shapes.inc"


camera{
location <-0,-25,-5>   
look_at <0,0,0>}

light_source {
<100,100, -100>
color	White}  

// Set a color of the background (sky)
background { color rgb< 1, 1, 1> }

     #fopen puntos "red.txt" write 

#declare Rs=0.1;    
#declare ts= texture{ pigment{color Blue}}; 

#declare n=10;                                                         
//#declare frecuencia=5;
#declare Dmax=1.1;
#declare a=2.456;       

#declare vec1=a*<1,0>;
#declare vec2=a*<1/2,sqrt(3)/2>;


#declare M=array[1000][1000];
#declare L=array[1000][1000];
#declare O=array[1000][1000];                             
#declare P=array[1000][1000];     


#declare P[0][0]=<0,0>;   

#declare M[0][0]=P[0][0]+1/3*vec1+1/3*vec2;
#declare L[0][0]=M[0][0]+<0,0,3.35>;
#declare O[0][0]=2*M[0][0]+<0,0,3.35>;

// sphere {M[0][0],0.3 texture{ts}} 
//__________________________________________
#declare enlaces=
union{
#declare i=0;
 #while(i<n) 
     #declare j=0;
    
   #while(j<n)  
  
         
        #declare P[i][j]=P[0][0]+j*vec2+i*vec1;        
      //  #declare P[h]=P[0][0]+a/2;
        
        #declare M[i][j]=M[0][0]+i*vec1+j*vec2;      
        #declare L[i][j]=L[0][0]+j*vec2+i*vec1;
        #declare O[i][j]=O[0][0]+j*vec2+i*vec1;
        #write (puntos,"C ",vstr(3,P[i][j]," ",7,5),"\n")
        #write (puntos,"C ",vstr(3,M[i][j]," ",7,5),"\n")  
        #write (puntos,"C ",vstr(3,L[i][j]," ",7,5),"\n")
        #write (puntos,"C ",vstr(3,O[i][j]," ",7,5),"\n")
        sphere {P[i][j],0.1 texture{ts}}
         sphere {M[i][j],0.1 texture{ts}}
        sphere {L[i][j],0.1 texture{ts}}
         sphere {O[i][j],0.1 texture{ts}}      
          
      
           
     #declare j=j+1;
   #end 
   #declare i=i+1;
 #end }                                 
                               
                               

#declare SM=array[1000][1000];
                             
#declare SP=array[1000][1000];
                               
#declare seg_cap=
union{
#declare i=0;
 #while(i<n)
  #declare j=0;
  #while(j<n)
   #declare SP[i][j]=P[i][j]+<0,0,6.7>;
   #declare SM[i][j]=M[i][j]+<0,0,6.7>;     
   #write (puntos,"C ",vstr(3,SP[i][j]," ",7,5),"\n")
   #write (puntos,"C ",vstr(3,SM[i][j]," ",7,5),"\n")
   sphere {SP[i][j],0.1 texture{ts}}
   sphere {SM[i][j],0.1 texture{ts}}

   #declare j=j+1;
   #end 
   #declare i=i+1;
 #end
} 

//_________________________________________





  
           
           
           object{enlaces}// rotate x*30 scale 2}                     
           object{seg_cap}