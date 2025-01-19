# teslamate

A self-hosted data logger for your Tesla 🚘

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/dkoshkin/teslamate-helm-chart/issues/new/choose)**

## How to use

```console
helm repo add teslamate https://nidr0x.github.io/teslamate-helm-chart
helm repo update
helm install teslamate teslamate/teslamate
```

## Installing the Chart

To install the chart with the release name `teslamate`

```console
helm install teslamate teslamate/teslamate
```

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install teslamate \
  --set env.TZ="Europe/Madrid" \
    teslamate/teslamate
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install teslamate teslamate/teslamate -f values.yaml
```

## Support

- Open an [issue](https://github.com/nidr0x/teslamate-helm-chart/issues/new/choose)
