all: image

image:
	docker buildx build --tag rmenn/fluentbit-nats-output:2.2v1 --builder gracious_tharp --platform linux/arm64/v8,linux/amd64 --push .

clean:
	rm -rf *.so *.h *~
