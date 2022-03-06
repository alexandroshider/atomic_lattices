/*
this program is for a lattice 2D of squares
*/

#include	"colors.inc"		
#include	"textures.inc"	
#include	"shapes.inc"


//set background and camera
camera{
location <-0,0,-20>   
look_at <0,0,0>}
light_source {
<100,100, -100>
color	White}  
background { color rgb< 1, 1, 1> }

//File for positions 
#fopen puntos "red.dat" write 

//color and size of points
#declare Rs=0.1;    
#declare ts= texture{ pigment{color Blue}}; 

//size of lattice
#declare n=5;                                                          
#declare a=2;       

//save points in arrays
#declare M=array[1000][1000];                             
#declare P=array[1000][1000];
#declare P[0][0]=<0,0>;
#declare M[0][0]=P[0][0]+a/2*<0,1>+a/2*<1,0>;

//__________________________________________
//generate the lattice
#declare enlaces=
union{
#declare i=0;
#while(i<n) 
    #declare j=0;
    #while(j<n)  
        #declare P[i][j]=P[0][0]+i*a*<0,1>+j*a*<1,0>;        
        #declare M[i][j]=M[0][0]+i*a*<0,1>+j*a*<1,0>;    
        #write (puntos,P[i][j],"\n")
        sphere {P[i][j],0.2 texture{ts}}
        sphere {M[i][j],0.2 texture{ts}}
        #declare j=j+1;
    #end 
    #declare i=i+1;
#end }

//_________________________________________
object{enlaces}
   
