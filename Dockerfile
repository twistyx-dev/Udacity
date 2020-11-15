FROM python:3.7.3-stretch

# Step 1:
WORKDIR /app

# Step 2:
COPY . main.go /app/

# Step 3:
RUN pip install --upgrade pip &&\
    pip install -r requirements.txt

# Step 4:
EXPOSE 80

## Step 5:
CMD ["go", "main.go"]
