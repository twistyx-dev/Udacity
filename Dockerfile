FROM python:3.7.3-stretch

# Step 1:
WORKDIR /app

# Step 2:
COPY . weather_app.py /app/

# Step 3:
RUN pip install --upgrade pip &&\
    pip install -r requirements.txt
#hadolint ignore=DL3013

# Step 4:
EXPOSE 80

## Step 5:
CMD ["python", "weather_app.py"]
