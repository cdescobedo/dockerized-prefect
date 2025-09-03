from prefect import flow


@flow(name="Dockerized Flow", log_prints=True)
def dockerized_flow() -> None:
    print("Hello from dockerized-prefect!!")


if __name__ == "__main__":
    dockerized_flow()
