.PHONY: help
help:
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: build
build: # Build Docker image for the project.
	docker build . -t duckdb-dbt --platform linux/x86_64

.PHONY: run
run: # Run Docker container in interactive mode.
	docker run --platform linux/x86_64 -v ./db:/db --rm -it duckdb-dbt bash
