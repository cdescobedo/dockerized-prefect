FROM ghcr.io/astral-sh/uv:python3.13-alpine as builder

ARG UV_INDEX_VTREGISTRY_PASSWORD

ENV TZ=UTC
ENV UV_COMPILE_BYTECODE=1

WORKDIR /opt/prefect/dockerized-prefect

COPY pyproject.toml uv.lock ./

RUN uv sync --locked

FROM python:3.13-alpine as prod

ENV TZ=UTC
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /opt/prefect/dockerized-prefect

COPY --from=builder /opt/prefect/dockerized-prefect/.venv ./.venv
COPY dockerized_flow.py entrypoint.sh ./

ENTRYPOINT [ "./entrypoint.sh" ]
