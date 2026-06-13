FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/comfy-org/ComfyUI.git /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Install ComfyUI Manager
RUN git clone https://github.com/Comfy-Org/ComfyUI-Manager.git \
    /app/custom_nodes/ComfyUI-Manager

RUN pip install -r /app/custom_nodes/ComfyUI-Manager/requirements.txt

EXPOSE 8188

CMD ["python", "main.py", "--listen", "0.0.0.0"]