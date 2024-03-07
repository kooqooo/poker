FROM python:3.10
WORKDIR /pocker
RUN pip install poetry

COPY pyproject.toml poetry.lock ./
COPY pocker pocker

RUN poetry install --no-root
EXPOSE 8000
ENTRYPOINT [ "poetry" ,"run", "uvicorn", "sample.main:app", "--host", "0.0.0.0" ]