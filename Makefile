SRC = $(shell find . -type f -name '*.go' -not -path "./vendor/*")


default: build


build:
	cd cmd && go build .

run:
	cd cmd && go run . /secret

checks: fmt-check

fmt-check:
	@test -z "$(shell gofmt -l $(SRC) | tee /dev/stderr)" || echo "[WARN] Fix formatting issues in with 'make fmt'"

.PHONY: build checks fmt-check