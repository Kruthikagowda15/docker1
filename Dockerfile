FROM python:3.10
WORKDIR /App
COPY . .
CMD ["python", "App.py"]
