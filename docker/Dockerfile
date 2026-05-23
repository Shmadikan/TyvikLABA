FROM python:3.11-alpine AS builder
WORKDIR /app
ENV PATH=/root/.local/bin:$PATH
COPY pyproject.toml .
COPY src/ ./src/
COPY tests/ ./tests/
RUN pip install --user --no-cache-dir .[test]

FROM python:3.11-alpine
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY pyproject.toml .
COPY src/ ./src/
COPY tests/ ./tests/
COPY seed.py .
COPY entrypoint.sh /entrypoint.sh
ENV PATH=/root/.local/bin:$PATH
EXPOSE 8042
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]