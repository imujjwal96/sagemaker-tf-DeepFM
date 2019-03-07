FROM tensorflow/tensorflow:latest-gpu-py3

WORKDIR /home/tf/

COPY src/trainCNN.py /home/tf/trainCNN.py
COPY input/ /opt/ml/input/

RUN mkdir -p /opt/ml/output/
RUN mkdir -p /opt/ml/model/

RUN pip install keras sklearn pydot

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

ENTRYPOINT ["python", "train.py"]
