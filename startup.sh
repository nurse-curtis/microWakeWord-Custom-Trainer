#!/bin/bash

# Check if the notebook exists in /data
if [ ! -f /data/basic_training_notebook.ipynb ]; then
    echo "Notebook not found in /data. Copying the default notebook..."
    cp /root/basic_training_notebook.ipynb /data/basic_training_notebook.ipynb
else
    echo "Notebook already exists in /data. Skipping copy."
fi

exec "$@"
