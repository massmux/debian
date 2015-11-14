# Docker debian

  mantainer Massimo S. Musumeci ( massmux (at) denali.uk )

This is a docker image with ssh support. 

how to build this image?

```bash
docker build -t denali/debian .
```
then do this to run it:

```bash
docker-compose up -d
```


```bash
base:
  image: denali/debian
  ports:
    - "2222:22"
  environment:
    CONTAINER_ROOT_PASS: test456
    AUTHORIZED_KEYS: <yourkeyhere>
```

## Contributing

Software developed on Denali group systems. Used Vps in debian OS.
Visit [![Denali](https://www.denali.eu/dena.png)](https://www.denali.eu) for more infos.
