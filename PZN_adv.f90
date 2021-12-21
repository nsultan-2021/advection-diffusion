parameter(m=500000)
parameter (n=100)
real tp(n,m),z(n),dz,dt
real da_te(m),t(m)
double precision v,Ct(n)

integer i,j,ni,nj,nt,stp_nt
real tseabed
open(10,file='infile.dat')
open(15,file='outfile.dat')
open(1051,file='in_P6.dat.txt')

read(10,*)ni,stp_nt,tseabed
do i=1,ni
read(10,*)z(i),tp(i,1),Ct(i)
end do



j=1
1302 read(1051,*,end=1301)t(j),tp(ni,j),da_te(j)
tp(1,j)=tseabed
j=j+1
goto 1302


1301 nt=j-1




do j=2,nt
do i=2,ni-1


dz=z(i)-z(i-1)    
dt=t(j)-t(j-1)  


if((dt*ct(i)/(dz**2)).gt.0.5)then
	write(*,*)i,j,'(Ct*dt)/(dz**2) =',dt*Ct(i)/(dz**2),'  must be < 0.5 '
    READ(*,*)
STOP
endif 

if(z(i).gt.5.0)v=0.0


tp(i,j)=tp(i,j-1)+dt*((v*(tp(i+1,j-1)-tp(i,j-1))/dz)+&
(Ct(i)*tp(i+1,j-1)+Ct(i-1)*tp(i-1,j-1)-Ct(i)*tp(i,j-1)-Ct(i-1)*tp(i,j-1))/(dz**2))

end do
end do

write(15,*)'Date   time_s    -z(m)    Du(kPa)  z(m)  C  vz'

do i=1,ni
do j=1,nt,stp_nt

write(15,'(5(f15.4,1x),2(f20.15,1x))')da_te(j),t(j),-z(i),tp(i,j),z(i),Ct(i),v

end do
write(15,*)'    '
end do

stop
end

