FROM tensorflow/tensorflow:1.10.1-gpu-py3

WORKDIR /home/tf/

COPY src/ /home/tf/
COPY input/ /opt/ml/input/

RUN mkdir -p /opt/ml/output/
RUN mkdir -p /opt/ml/model/

RUN apt-get update && apt-get install -y --no-install-recommends \
	python3-tk \
	&& \
    	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pip install keras sklearn pydot

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

ENTRYPOINT ["python", "main.py"]
