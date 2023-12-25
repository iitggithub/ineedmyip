FROM python:2

MAINTAINER "The Ignorant IT Guy" <iitg@gmail.com>

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py ./

CMD [ "python", "./server.py" , "--port", "22222"]
