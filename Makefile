VERSION=9.10.3

wsl:
	docker buildx build  --build-arg edition=free --build-arg version=${VERSION} -t kheerand/graphdb:${VERSION}-free free-edition --progress=plain --push

wsl-no-push:
	docker buildx build  --build-arg edition=free --build-arg version=${VERSION} -t kheerand/graphdb:${VERSION}-free free-edition --progress=plain 

free:
	docker buildx build --platform linux/amd64,linux/arm64 --build-arg edition=free --build-arg version=${VERSION} -t kheerand/graphdb:${VERSION}-free free-edition --progress=plain --push

ee:
	docker build --no-cache --pull --build-arg edition=ee --build-arg version=${VERSION} -t ontotext/graphdb:${VERSION}-ee .

se:
	docker build --no-cache --pull --build-arg edition=se --build-arg version=${VERSION} -t ontotext/graphdb:${VERSION}-se .

ee-upload: ee
	docker push ontotext/graphdb:${VERSION}-ee

se-upload: se
	docker push ontotext/graphdb:${VERSION}-se
