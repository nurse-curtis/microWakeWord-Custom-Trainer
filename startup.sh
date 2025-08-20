#!/bin/bash

#Install requirements
pip install --no-cache-dir -r /tmp/requirements.txt

# Check if basic training notebook exists in /data
if [ ! -f /data/basic_training_notebook.ipynb ]; then
    echo "Basic training notebook not found in /data. Copying the default notebook..."
    cp /root/basic_training_notebook.ipynb /data/basic_training_notebook.ipynb
else
    echo "Basic training notebook already exists in /data. Skipping copy."
fi

# Check if advanced training notebook exists in /data
if [ ! -f /data/advanced_training_notebook.ipynb ]; then
    echo "Advanced training notebook not found in /data. Copying the default notebook..."
    cp /root/advanced_training_notebook.ipynb /data/advanced_training_notebook.ipynb
else
    echo "Advanced training notebook already exists in /data. Skipping copy."
fi

exec "$@"
