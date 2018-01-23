FROM lukfor/cloudgene

MAINTAINER Cloudgene-Team: Sebastian Schoenherr <sebastian.schoenherr@i-med.ac.at> and Lukas Forer <lukas.forer@i-med.ac.at>

# Add imputationserver specific pages
ADD pages /opt/cloudgene/sample/pages

# Add apps.yaml file with imputationserver and hapmap2
ADD apps.yaml /opt/cloudgene/apps.yaml

ENV REPOSITORY="/opt/cloudgene/apps.yaml"

# Install apps once, and run startup script to start Hadoop and Cloudgene
CMD ["/usr/bin/startup"]
