FROM ghcr.io/astral-sh/uv:python3.13-alpine

ARG UV_INDEX_VTREGISTRY_PASSWORD

ENV TZ=UTC

WORKDIR /opt/prefect/dockerized-prefect

COPY pyproject.toml pyproject.toml
COPY uv.lock uv.lock
RUN uv sync --locked

COPY main.py main.py
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
