#!/bin/bash

# Start Ollama in the background.
/bin/ollama serve &
pid=$!

# Wait for Ollama to start.
echo "Waiting for Ollama to start..."
# Loop until 'ollama list' returns success (exit code 0)
while ! ollama list > /dev/null 2>&1; do
  sleep 1
done

echo "Ollama started. Pulling models..."
echo "Retrieving model (llama3.2:1b)..."
ollama pull llama3.2:1b
echo "Retrieving model (mxbai-embed-large)..."
ollama pull mxbai-embed-large
echo "Done."

# Wait for Ollama process to finish.
wait $pid