# Vector by Datadog, windows nano build

I cobbled this together as the official repo doesn't yet cover building windows based containers.
Nano keeps it small; should run on EKS windows fine. Needs the config directory overriding by either mapping a config map to a location and changing cmd to use that instead or similar.

No ports are exposed by default in the container image.

## Building a 2019ltsc nano image

`docker build -t chrismckee/vector-nt:0.26.0-windowsserver.nano.ltsc2019 -t chrismckee/vector-nt:0.26.0-windowsnano.amd64 .`

## Building a 2022ltsc image requires building on windows 11 or server 2022

`docker build --build-arg NANOSERVER_LTSCVERSION=ltsc2022 -t chrismckee/vector-nt:0.26.0-windowsserver.nano.ltsc2022 .`

## BuildArgs

| Arg | Default |
|NANOSERVER_LTSCVERSION | ltsc2019 |
| VECTOR_VERSION | 0.26.0|


- https://aws.amazon.com/blogs/containers/streaming-logs-from-amazon-eks-windows-pods-to-amazon-cloudwatch-logs-using-fluentd/
- https://github.com/awslabs/amazon-eks-ami/blob/master/log-collector-script/windows/eks-log-collector.ps1
