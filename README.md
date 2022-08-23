# Knowage Helm Repository

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add knowage https://knowagelabs.github.io/Knowage-Helm

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
knowage` to see the charts.

To install the knowage chart:

    helm install my-knowage knowage/knowage

To uninstall the chart:

    helm delete my-knowage
