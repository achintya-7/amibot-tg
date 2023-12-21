FROM golang:1.20-alpine3.18 AS builder
WORKDIR /app
COPY ./server .
RUN go build -o main main.go 

FROM python:3.11-alpine
WORKDIR /app
COPY --from=builder /app/main .
COPY pyproject.toml poetry.lock /app/
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main --no-root
COPY . /app
EXPOSE 3333
CMD ["sh", "-c", "poetry run python main.py & ./main"]
