# advection-diffusion
#PZN_adv.f90 is used to solve the partial differential equation (eq. 1 in the MS) by using implicit method.
#The velocity (m/s) is introduced directly in PZN_adv.f90 (line 46)
#In the infile file (infile.dat) are introduced:
#line 1:  number of vertical node;  parameter for the output data;    pressure at the seabed
#lines 2 to n: depth(m)  initial pressure(kPa)   hydraulic_diffusivity(m2/s) 
