#!/data/data/com.termux/files/usr/bin/bash
set -e
BASE="$HOME/sina_local_ai"
SRC="$BASE/llama.cpp"
MODEL="$BASE/Qwen3-1.7B-Q4_K_M.gguf"
mkdir -p "$BASE"

echo "SINA AI Local Pro setup"
echo "This downloads/builds llama.cpp and downloads the Qwen3 1.7B Q4_K_M local model."
echo "The model is about 1.28 GB, so make sure you have enough free storage."

pkg update -y
pkg install -y git cmake make clang curl

if [ ! -d "$SRC/.git" ]; then
  git clone --depth 1 https://github.com/ggml-org/llama.cpp.git "$SRC"
fi

cmake -S "$SRC" -B "$SRC/build" -DCMAKE_BUILD_TYPE=Release -DGGML_OPENMP=OFF -DGGML_LLAMAFILE=OFF
cmake --build "$SRC/build" --config Release --target llama-server --parallel 2

if [ ! -f "$MODEL" ]; then
  curl -L --fail --progress-bar \
    "https://huggingface.co/Qwen/Qwen3-1.7B-GGUF/resolve/main/Qwen3-1.7B-Q4_K_M.gguf?download=true" \
    -o "$MODEL"
fi

cat > "$BASE/start_sina_ai.sh" <<EOF
#!/data/data/com.termux/files/usr/bin/bash
"$SRC/build/bin/llama-server" -m "$MODEL" --host 127.0.0.1 --port 8080 -c 4096
EOF
chmod +x "$BASE/start_sina_ai.sh"

echo
echo "SETUP COMPLETE"
echo "Model: $MODEL"
echo "Server: $SRC/build/bin/llama-server"
echo
echo "Start SINA AI backend with:"
echo "$BASE/start_sina_ai.sh"
