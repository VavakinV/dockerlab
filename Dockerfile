FROM  tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim AS builder

WORKDIR /app

RUN pip install .

COPY . ./app

FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim

WORKDIR /app

COPY --from=builder ./app ./app

EXPOSE 8111

CMD ["sh", "-c", "uvicorn src.main:app --reload"]
