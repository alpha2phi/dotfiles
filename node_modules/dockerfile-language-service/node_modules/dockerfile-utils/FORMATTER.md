# Formatting Dockerfiles

The formatter included will perform the following operations on a Dockerfile:

- remove leading whitespace if it begins with an instruction
- remove trailing whitespace if and only if the line only contains whitespace characters
- take escaped newlines into account and indent Dockerfile instructions that span multiple lines

## Command Line Interface

If no file is specified, the CLI will attempt to format the contents of a file named `Dockerfile` in the current working directory if it exists.

### Help
```
> dockerfile-utils format --help
Usage: dockerfile-utils format [options] [file]

Options:

  -h, --help                Output usage information
  -s, --spaces <number>     Format with the <number> of spaces
  -t, --tabs                Format with tabs
```

### Example
```Dockerfile
FROM node:alpine
 COPY lib /dockerfile-utils/lib
  COPY bin /dockerfile-utils/bin
   COPY package.json /dockerfile-utils/package.json
WORKDIR /dockerfile-utils/
RUN npm install --production && \
chmod +x /dockerfile-utils/bin/dockerfile-utils
ENTRYPOINT [ "/dockerfile-utils/bin/dockerfile-utils" ]
```
#### Formatting with Tabs
```
> dockerfile-utils format -t
FROM node:alpine
COPY lib /dockerfile-utils/lib
COPY bin /dockerfile-utils/bin
COPY package.json /dockerfile-utils/package.json
WORKDIR /dockerfile-utils/
RUN npm install --production && \
	chmod +x /dockerfile-utils/bin/dockerfile-utils
ENTRYPOINT [ "/dockerfile-utils/bin/dockerfile-utils" ]
```
#### Formatting with Spaces
```
> dockerfile-utils format -s 5
FROM node:alpine
COPY lib /dockerfile-utils/lib
COPY bin /dockerfile-utils/bin
COPY package.json /dockerfile-utils/package.json
WORKDIR /dockerfile-utils/
RUN npm install --production && \
    chmod +x /dockerfile-utils/bin/dockerfile-utils
ENTRYPOINT [ "/dockerfile-utils/bin/dockerfile-utils" ]
```
