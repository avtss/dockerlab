FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim AS builder

WORKDIR /app

COPY . .

RUN pip install .

ARG TEST_PROFILE=false

RUN if [ "$TEST_PROFILE" = "true" ]; then \
        pip install ".[test]"; \
    fi

FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /app /app

EXPOSE 8111

CMD ["sh", "-c", "uvicorn src.main:app --host 0.0.0.0 --port 8111"]
