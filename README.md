# Michigan Imputation Server Docker Image :whale:

[![Docker Build Status](https://img.shields.io/docker/build/genepi/imputationserver.svg)](https://hub.docker.com/r/genepi/imputationserver)
[![Docker Pulls](https://img.shields.io/docker/pulls/genepi/imputationserver.svg)](https://hub.docker.com/r/genepi/imputationserver)
![Travis](https://img.shields.io/travis/genepi/imputationserver-docker.svg)

This repository provides a Docker Image to run your own instance of the popular [Michigan Imputation Server](https://imputationserver.sph.umich.edu). The workflow itself is executed with the [Cloudgene](http://cloudgene.uibk.ac.at) workflow system for Hadoop MapReduce. 

## Requirements

[Docker](http://docker.io) must be installed on your local computer. Please checkout the [step by step guide](https://docs.docker.com/engine/installation/linux/ubuntu/) to install the latest version.


## Start your own Imputation Server

After the successful installation of Docker, all you need to do is:

```
 docker run -d -p 8080:80 genepi/imputationserver:v1.4.1
```
After about 1 minute your Imputation Server instance is ready and you are able to access it on http://localhost:8080.

Login as **admin** with the default admin password **admin1978**. You can now start a job by clicking on *Run*. More about submitting jobs and data preparation can be found in our [Documentation](http://imputationserver.readthedocs.io/en/latest/getting-started/#setup-your-first-imputation-job).

## Make your Imputation Server persistent

Docker images are not persistent, all jobs submitted inside one session will be lost after restart. To keep your jobs, results and installed reference panels between sessions, you need to mount a folder from your host to the container:

```
docker run -d -p 8080:80  -v /home/lukas/imputationserver-data/:/data/ genepi/imputationserver:v1.4.1
```
This folder contains all results of your jobs, all installed reference panels and all configurations. To restart a session, you have to use the same folder. It is also possible to use different folders for different projects or tests.

## Install a new Reference Panel

This image is delivered with the Hapmap2 Reference Panel. To install additional reference panels  (e.g. 1000 Genomes Phase3), you have to start a persistent cluster:

```
docker run -d -p 8080:80  -v /home/lukas/imputationserver-data/:/data/ genepi/imputationserver:v1.4.1
```

**Important**: It's recommended to start the Docker image from a computer with a HDD having at least 100 GB free space and a fast Internet connection (Reference panel size is about **14 GB**).

After logging in, you have to open the *Admin-Panel*:

![Admin Panel](../master/images/admin-panel.png?raw=true)

Click on the *Applications* tab to see all installed applications.

![Applications](../master/images/applications.png?raw=true)

After clicking on *Install App* a new Dialog appears, where you can enter the ID and the URL of a public available reference panel:

![Install App](../master/images/install-app.png?raw=true)

By clicking on *OK* the installation starts. Depending on your Internet connection and computer resources it could take several minutes. If the installation was successful, you should see your reference panel in the Reference Panel list when you submit a new job:

![Reference Panel List](../master/images/run.png?raw=true)

Since all reference panels are installed in your provided data folder, you can stop and restart your cluster without reinstalling them.

## Public Reference Panels

Currently, the following Reference Panels are public available:

### Hapmap2

- **ID:** hapmap2
- **URL:** https://imputationserver.sph.umich.edu/static/downloads/releases/hapmap2-2.0.0.zip

### 1000 Genomes Phase 3

- **ID:** 1000genomes-phase3
- **URL:** https://imputationserver.sph.umich.edu/static/downloads/releases/1000genomes-phase3-3.0.0.zip

## Citation

Please cite this paper if you use Michigan Imputation Server:

> Das S, Forer L, Schönherr S, Sidore C, Locke AE, Kwong A, Vrieze S, Chew EY, Levy S, McGue M, Schlessinger D, Stambolian D, Loh PR, Iacono WG, Swaroop A, Scott LJ, Cucca F, Kronenberg F, Boehnke M, Abecasis GR, Fuchsberger C. [Next-generation genotype imputation service and methods](https://www.ncbi.nlm.nih.gov/pubmed/27571263). Nature Genetics 48, 1284–1287 (2016).


## Contact

Feel free to contact [us](https://imputationserver.sph.umich.edu/start.html#!pages/contact) in case of any problems.
