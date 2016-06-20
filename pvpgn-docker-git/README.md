## Custom git repo

You can specify a custom git repo during container build by using `--build-arg` as in the example below.

### Example:

```
docker build --build-arg REPO=https://github.com/pvpgn/pvpgn-server.git .
```
