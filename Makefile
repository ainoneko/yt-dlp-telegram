all: test

venv:
	test -d venv || python3.11 -m venv --copies venv && venv/bin/pip install -r requirements.txt

test: venv
	@echo Run test locally
	. venv/bin/activate && python3 main.py

build:
	@echo Build the docker image
	docker build -t neko_yt_dlp_bot .

run:
	@echo Run the docker image
	docker run neko_yt_dlp_bot

docker: build run
