<div align="center">
  <img src="https://raw.githubusercontent.com/stujenn/microWakeWord-Custom-Trainer/refs/heads/main/mmw.png" alt="microWakeWord Logo" width="100" />
  <h1>microWakeWord Custom Trainer</h1>
</div>

Easily train microWakeWord detection models with this pre-built Docker image.

## Prerequisites

- Docker installed on your system.
- An NVIDIA GPU with CUDA support (optional but recommended for faster training).

## Quick Start

Follow these steps to get started with the microWakeWord Custom Trainer:

### 1. Clone the Repo

Clone the GitHub repo:
```bash
git clone https://github.com/stujenn/microWakeWord-Custom-Trainer
cd microWakeWord-Trainer-Docker
```

### 1. Build the Docker Image

Build the docker image from the provided dockerfile:
```bash
docker build -t microwakeword-custom-trainer .
```

### 2. Run the Docker Container

Start the container with a mapped volume for saving your data and expose the Jupyter Notebook:
```bash
docker run --rm -it \
    --gpus all \
    -p 8888:8888 \
    -v $(pwd):/data \
    microwakeword-custom-trainer
```
--gpus all: Enables GPU acceleration (optional, remove if not using a GPU).
-p 8888:8888: Exposes the Jupyter Notebook on port 8888.
-v $(pwd):/data: Maps the current directory to the container's /data directory for saving your files.

### 3. Access Jupyter Notebook

Open your web browser and navigate to:
```bash
http://localhost:8888
```
The notebook interface should appear.

### 4. Edit the Wake Word

Locate and edit the second cell in the notebook to specify your desired wake word:
```bash
target_word = 'khum_puter'  # Phonetic spellings may produce better samples
```
Change 'khum_puter' to your desired wake word.

### 5. Run the Notebook
Run all cells in the notebook. The process will:

Generate wake word samples.
Train a detection model.
Output a quantized .tflite model for on-device use.

### 6. Retrieve the Trained Model and JSON
Once the training is complete, the quantized .tflite model and .json will be available for download. Follow the instructions in the last cell of the notebook to download the model.

## Resetting to a Clean State
If you need to start fresh:

### Delete your data folder:
Locate and delete the data folder that was mapped to your Docker container.

### Restart the Docker container:
Run the container again using the steps provided above.

### Fresh notebook generated:
Upon restarting, a clean version of the training notebook will be placed in the newly created data directory.
This will reset your MicroWakeWord-Training-Docker environment to its initial state.

## Credits

This project builds upon the excellent work of [kahrendt/microWakeWord](https://github.com/kahrendt/microWakeWord). A huge thank you to the original authors for their contributions to the open-source community!




