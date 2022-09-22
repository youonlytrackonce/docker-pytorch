xhost +

nvidia-docker run -it \
	--gpus all \
	-e NVIDIA_VISIBLE_DEVICES=all \
	-e NVIDIA_DRIVER_CAPABILITIES=all \
	--privileged \
	--cap-add=CAP_SYS_ADMIN \
	--network=host \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home:/host/home \
	-e DISPLAY=unix$DISPLAY \
	-w /host/home/ \
	mas:$1
