# HRA Digital Objects Server

A container for serving digital objects published via the [hra-do-processor](https://github.com/hubmapconsortium/hra-do-processor). It advertises digital objects as Linked Open Data and provides a SPARQL endpoint.

STATUS: **ALPHA** - The sparql endpoint works as intended and hosting files works, but does not implement the needed content negotiation, vhost handling, and other things we'd like to see in a 1.0 version of this server.

## Requirements

To run locally, you will need Docker installed and have run the hra-do-processor and built a deployment using the `deploy` command which generates a `dist` folder containing the digital objects and a `blazegraph.jnl` which holds all of the enriched graphs built by the hra-do-processor.

## Running locally

To run locally, first pull the docker container:

`docker pull ghcr.io/hubmapconsortium/hra-do-server:main`

To run, you will need to mount the /dist volume when starting the container:

`docker run -p 8000:8000 -p 8080:8080 --mount type=bind,source=/absolute/path/to/dist,target=/dist -it ghcr.io/hubmapconsortium/hra-do-server:main`

This exposes two ports:

* **8080** - the blazegraph server. In production, you should not expose this port, though it is probably safe to do so.
* **8000** - the primary port exposed that is intended to be used in production. It hosts the digital objects and is a proxy to the internal blazegraph server's sparql endpoint.

On port 8000, you will have two primary endpoints:

* **/sparql** - a SPARQL endpoint that hosts all digital objects' named graphs for live queries
* **/{DIGITAL OBJECT TYPE}/{DIGITAL OBJECT NAME}/{DIGITAL OBJECT VERSION}/** - each digital object has a route like so. When we get content negotiation other routes will become possible.
