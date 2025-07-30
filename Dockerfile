FROM python:3.10-slim

# Install Python libs
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy code & model-weights folder (if you check them in)
COPY serve.py .
# If weights are in Git LFS or HF hub, your code downloads them at runtime

EXPOSE 8080
CMD ["uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8080"]
