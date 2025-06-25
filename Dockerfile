FROM python:3.12

WORKDIR /usr/local/app

COPY requirements.txt ./ 
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py ./ 
EXPOSE 8000

RUN useradd app
USER app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
