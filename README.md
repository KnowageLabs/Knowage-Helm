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

To update your deployment you should use:

```console
$ helm upgrade -f myvals.yaml my-chart-name .
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

Knowage is open to external contributions. You can submit your contributions into this repository through pull requests.
Before starting, here there are a few things you must be aware of: 

-   This project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). By participating in this
    project, you agree to abide by its terms.
-   When you open a pull request, you must sign the
    [Individual Contributor License Agreement](./CLA.md) by stating in a comment 
	_"I have read the CLA Document and I hereby sign the CLA"_
-   Please ensure that your contribution passes all tests. If there are test failures, you will need to address them
    before we can merge your contribution.
