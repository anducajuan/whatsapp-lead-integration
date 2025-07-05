FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

RUN apt-get update && apt-get install -y curl build-essential

RUN curl -sSL https://install.python-poetry.org | python3 - && \
ln -s ~/.local/bin/poetry /usr/local/bin/poetry

COPY pyproject.toml poetry.lock* /app/
RUN poetry config virtualenvs.create false \
&& poetry install --no-root

COPY src/whatsapp_lead_integration ./whatsapp_lead_integration

CMD ["poetry", "run", "gunicorn", "whatsapp_lead_integration.app:app", "--workers=4", "--bind=0.0.0.0:8000"]
