FROM python:3.11-slim

WORKDIR /app

# Install dependencies first so this layer caches between code changes
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

EXPOSE 5000

ENV PYTHONUNBUFFERED=1

# Run the app
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--timeout", "120", "app:app"]
