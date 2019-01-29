# Use an official Python runtime as a parent image
FROM tensorflow/tensorflow:1.12.0-gpu-py3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN apt install wget
RUN cd /app
# RUN wget https://repo.continuum.io/archive/Anaconda3-5.3.0-Linux-x86_64.sh

COPY ./Anaconda3-5.3.0-Linux-x86_64.sh /app

RUN chmod 777 Anaconda3-5.3.0-Linux-x86_64.sh
# COPY ./Anaconda3-5.2.0-Linux-x86_64.sh /app/
RUN /app/Anaconda3-5.3.0-Linux-x86_64.sh -b -p /app/anaconda3

ENV PATH /app/anaconda3/bin:$PATH

#RUN ./app/Anaconda3-5.2.0-Linux-x86_64.sh

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# RUN source ~/.bashrc

# RUN ./app/Anaconda3-5.2.0-Linux-x86_64.sh

# RUN conda install -c conda-forge jupyterhub
# RUN conda install jupyterlab
# RUN conda install notebook

# RUN conda env create -f dl_env_linux_gpu.yml -n dl
# RUN conda create -n dl python=3.6
# RUN echo "source activate dl" > ~/.bashrc
# ENV PATH /opt/conda/envs/env/bin:$PATH



# Make port 80 available to the world outside this container
#jupyterhub
#EXPOSE 8888

# app.py example
#EXPOSE 80

# Define environment variable
ENV NAME DEV

ENV PASSWORD deepstack

# Run app.py when the container launches
# CMD ["python", "app.py"]

# CMD ["jupyterhub"]


# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]


EXPOSE 8888
# CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
CMD ["jupyter", "lab", "--allow-root", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--config=/app/config/jupyter/jupyter_notebook_config.py"]
