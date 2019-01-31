#sudo docker run -it  -p 8888:8888 -v /home/minds/dl/DeepStack/:/app/config/jupyter  deepstack bash

docker run --runtime=nvidia -it -p 8888:8888 -v /home/minds/dl/:/app/dl deepstack bash
 
