FROM python:3.7.3-stretch

WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

RUN pip install --upgrade pip &&\
    pip install -r requirements.txt

EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
