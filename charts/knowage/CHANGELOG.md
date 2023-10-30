
# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.13] - 2023-10-30

### Added

### Changed

### Fixed

- Websocket connection in internal reverse proxy

## [1.0.12] - 2023-10-27

Please set your values.yaml to disable or to enable priority classes: see knowage.priorityClasses.enabled; they are useful in cluster with limited resources to let the main app of KNOWAGE to take precedence to other apps.

Also, take a look to knowage.resources, knowage.python.resources and knowage.r.resources and set the resources for every app: they're optional; the default values was the ones previously defined.

Finally, we changed the way the chart manages the persistentvolumeclaim/knowage-main: if a persistentvolumeclaim/knowage-main already exists, KNOWAGE will use it, if doesn't, the charts creates a new one. You must need to annotate your current persistentvolumeclaim/knowage-main using:

```
kubectl annotate pvc knowage-main helm.sh/resource-policy=keep
```

We suggest you to migrate your PVC to a ReadWriteMany one.

### Added

- Primitive support to priority classes
- Let the user to set the resources for every KNOWAGE app

### Changed

- A new persistentvolumeclaim/knowage-main is now ReadWriteMany by default. 

### Fixed

- Minor fixes to the internal reverse proxy

## [1.0.11] - 2023-10-17

### Added

- Add new config knowage.useProfileFactoryClass for debug only: disabled by default

### Changed

### Fixed

- Fix missing Python and R services when using the new knowage.python.deploy and knowage.r.deploy configurations

## [1.0.10] - 2023-10-16

### Added

### Changed

- JMX

### Fixed

## [1.0.9] - 2023-10-10

Here we would have the update steps for 1.0.9 for people to follow.

### Added

- TLS secrets for both KNOWAGE and the internal reverse proxy: the user can provides its own certificate creating or updating them before the deploy.
- OAuth2 sample configuration. More will be present on the README.

### Changed

- Ingress use HTTPS by default to call the internal reverse proxy and/or KNOWAGE.

### Fixed
