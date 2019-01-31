docker run -d --runtime=nvidia --restart unless-stopped  -p 8888:8888 -v /home/minds/dl:/app/dl deepstack /app/dl/DeepStack/runStart.sh

# "sleep 5 && jupyter lab --allow-root --ip=0.0.0.0  --config=/app/dl/DeepStack/jupyter_notebook_config.py"



#sudo docker run -d -p 9000:80 -p 8888:8888 dockerstack jupyter lab --allow-root --ip=0.0.0.0         # Same thing, but in detached mode
