import os
import numpy as np
import matplotlib.pylab as plt
from numpy import genfromtxt

#os.chdir(r"D:\Kelsey_Documents\2021-2022_Academic_Year\LBM_Scripts")
nx = 32
ny = 32
nz = 32
N=nx*ny*nz

slice = 6

##Upper plate
point1 = 0

##Lower plate
point5 = 0

##Phase Field
ID = genfromtxt('PhaseIdentifier.txt', delimiter=' ')

ID.shape = (nx,ny,nz)

mesh=(nx,ny,nz)
data=np.ones(mesh,dtype=np.uint8)
count = 0
count1 = 0
for z in range(0,nz):
    for y in range(0,ny):
        for x in range(0,nx):
            n=z*nx*ny+y*nx+x
            data[x,y,z]=ID[x,y,z]
            if (count == 0 and ID[x,y,z] == 2):
                count = count + 1
                if (x>2):
                    point5 = x-2
                else:
                    point5 = 0
        for x2 in range (nx-1,0,-1):
            n=z*nx*ny+y*nx+x2
            if (count1 == 0 and ID[x2,y,z] == 2):
                count1 = count1 + 1
                if (x2>1):
                    point1 = x2-1
                else:
                    point1 = 0                 

data.tofile("ID.raw")

point2 = point1 + 1
point3 = point1 + 2
point4 = point1 + 3

point6 = point5 + 1
point7 = point5 + 2
point8 = point5 + 3

# Test that ID.raw was saved correctly (change plot to ID2)
ID2 = np.fromfile('ID.raw',dtype = np.uint8) 
ID2.shape = (nx,ny,nz)

##Fluid Phases
ID = genfromtxt('qDirection.txt', delimiter=' ')

ID.shape = (nx,ny,nz)

data=np.ones(mesh,dtype=np.double)
for z in range(0,nz):
    for y in range(0,ny):
        for x in range(0,nx):
            n=z*nx*ny+y*nx+x
            data[x,y,z]=ID[x,y,z]

data.tofile("qDirection.raw")

##Signed Distance
ID = genfromtxt('Distance.txt', delimiter=' ')

ID.shape = (nx,ny,nz)

data=np.ones(mesh,dtype=np.double)
for z in range(0,nz):
    for y in range(0,ny):
        for x in range(0,nx):
            n=z*nx*ny+y*nx+x
            data[x,y,z]=ID[x,y,z]

data.tofile("SD.raw")

# Test that raw was saved correctly 
ID2 = np.fromfile('SD.raw',dtype = np.double) 
ID2.shape = (nx,ny,nz)


##Signed Distance MC
ID = genfromtxt('DistanceMC.txt', delimiter=' ')

ID.shape = (nx,ny,nz)

data=np.ones(mesh,dtype=np.double)
for z in range(0,nz):
    for y in range(0,ny):
        for x in range(0,nx):
            n=z*nx*ny+y*nx+x
            data[x,y,z]=ID[x,y,z]

data.tofile("SDMC.raw")

# Test that raw was saved correctly 
ID2 = np.fromfile('SDMC.raw',dtype = np.double) 
ID2.shape = (nx,ny,nz)

##LIBB A
ID = genfromtxt('libbA.txt', delimiter=' ')
ID.tofile("libbA.raw")

ID2 = np.fromfile('libbA.raw',dtype = np.double) 

##Plot each neighbor section together
#for q in range(0,18):
q=4
data=np.ones(mesh,dtype=np.double)
for z in range(0,nz):
    for y in range(0,ny):
        for x in range(0,nx):
            n=z*nx*ny+y*nx+x
            data[x,y,z]=ID2[n+q*N]
            
print("LIBBA")
    

##LIBB BC
ID = genfromtxt('libbBC.txt', delimiter=' ')
ID.tofile("libbBC.raw")

ID2 = np.fromfile('libbBC.raw',dtype = np.double) 

##Plot each neighbor section together
for q in range(0,18):
    data=np.ones(mesh,dtype=np.double)
    for z in range(0,nz):
        for y in range(0,ny):
            for x in range(0,nx):
                n=z*nx*ny+y*nx+x
                data[x,y,z]=ID2[n+q*N]
                
    # plt.figure(1)
    # plt.title('libb bc %i'%q)
    # plt.pcolormesh(data[:,:,slice],cmap='hot')
    # plt.colorbar()
    # plt.grid(True)
    # plt.axis('equal')
    # plt.xlim(0-int(ny/20), ny+int(ny/20))
    # plt.ylim(0-int(nx/20), nx+int(nx/20))
    # plt.xlabel('y')
    # plt.ylabel('x, lbm z')
    # plt.show()   

print(" ")
print("LIBBBC")
