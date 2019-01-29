# Use an official Python runtime as a parent image
FROM tensorflow/tensorflow:1.12.0-gpu-py3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

RUN conda create -n dl python=3.6
RUN echo "source activate dl" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

RUN conda install -c conda-forge jupyterhub
RUN conda install jupyterlab
RUN conda install notebook


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
