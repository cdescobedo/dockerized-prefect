from prefect import flow


@flow(log_prints=True)
def main() -> None:
    print("Hello from dockerized-prefect!!")


if __name__ == "__main__":
    main()
