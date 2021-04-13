# Knowage Helm Chart

## What is Knowage?

Knowage is the professional open source suite for modern business analytics over traditional sources and big data systems.

> [knowage-suite.com](https://www.knowage-suite.com)

## Run Knowage

To deploy Knowage on your Kubernetes cluster you could use:

```console
$ helm install my-chart-name .
```

If you want to customize your deployment you'll probably use:

```console
$ helm install -f myvals.yaml my-chart-name .
```

Where ```myvals.yaml``` is a copy of ```values.yaml``` where you could put the data of your installation.

To uninstall the chart you could use:

```console
$ helm uninstall my-chart-name
```

## Debug

To debug the templates you could use:

```console
# Render the entire chart
$ helm template -f myvals.yaml trial . 

# Render only a specific template
$ helm template -f myvals.yaml -s templates\deployment.yaml trial .
```

## License

View license information [here](https://github.com/KnowageLabs/Knowage-Server/) for the software contained in this image.

## How to contribute

Before start to contribute, please read and sign the [Contributor License Agreement](https://www.clahub.com/agreements/KnowageLabs/Knowage-Server-Docker).
The contribution process is based on GitHub pull requests (https://help.github.com/articles/about-pull-requests/).
