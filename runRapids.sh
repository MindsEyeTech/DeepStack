#sudo docker run -it  -p 8888:8888 -v /home/minds/dl/DeepStack/:/app/config/jupyter  deepstack bash

docker run --runtime=nvidia -it -p 8888:8888 -v /home/minds/dl/:/app/dl nvcr.io/nvidia/rapidsai/rapidsai:cuda10.0_ubuntu16.04
 bash
 
