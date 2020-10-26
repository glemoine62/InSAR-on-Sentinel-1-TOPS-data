CC=g++
NVCC=nvcc
CXXFLAGS= -O3 -Wextra -std=c++11
CUDAFLAGS= -std=c++11 -c -arch=sm_60
LIBS= -lpthread -lcudart -lcublas -lcusolver -lgdal -ltinyxml2
LIBDIRS=-L/usr/lib/x86_64-linux-gnu
INCDIRS=-I/usr/include
*.o: *.cu
	$(NVCC) $(CUDAFLAGS) *.cu
all: *.o
	$(CC) -o gpuSNAP Main.cpp Func.cpp DataTypes.cpp *.o $(LIBDIRS) $(INCDIRS) $(LIBS) $(CXXFLAGS)
clean:
	rm -rf gpuSNAP *.o
