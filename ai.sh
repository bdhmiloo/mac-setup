# Ollama
export OLLAMA_METAL=1
export OLLAMA_NUM_GPU=999  # Use all GPU cores
export OLLAMA_MAX_LOADED_MODELS=2
export OLLAMA_MAX_MEMORY=$(sysctl -n hw.memsize)
export OLLAMA_MAX_RAM=12GB
export OLLAMA_NUM_PARALLEL=2
export OLLAMA_MAX_DOWNLOAD_WORKERS=4
export OLLAMA_REGISTRY=https://registry.npmmirror.com
