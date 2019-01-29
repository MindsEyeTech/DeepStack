# Use an official Python runtime as a parent image
FROM tensorflow/tensorflow:1.12.0-gpu-py3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# COPY ./Anaconda3-5.2.0-Linux-x86_64.sh /app/

# RUN ./app/Anaconda3-5.2.0-Linux-x86_64.sh

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# RUN ./app/Anaconda3-5.2.0-Linux-x86_64.sh

# RUN conda install -c conda-forge jupyterhub
# RUN conda install jupyterlab
# RUN conda install notebook

# RUN conda env create -f dl_env_linux_gpu.yml -n dl
# RUN conda create -n dl python=3.6
# RUN echo "source activate dl" > ~/.bashrc

ENV PATH /opt/conda/envs/env/bin:$PATH



# Make port 80 available to the world outside this container
#jupyterhub
EXPOSE 8000

# app.py example
#EXPOSE 80

# Define environment variable
ENV NAME DEV

# Run app.py when the container launches
# CMD ["python", "app.py"]

CMD ["jupyterhub"]
