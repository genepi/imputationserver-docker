FROM genepi/cloudgene

MAINTAINER Sebastian Schoenherr <sebastian.schoenherr@i-med.ac.at>, Lukas Forer <lukas.forer@i-med.ac.at>

# Install R Packages
RUN R -e "install.packages('RColorBrewer', repos = 'http://cran.rstudio.com' )"
# TODO: ask Seb. needed? works also without package. could ne removed from R report?
# RUN R -e "install.packages('geneplotter', repos = 'http://cran.rstudio.com' )"

# Add imputationserver specific pages
ADD pages /opt/cloudgene/sample/pages

# Add apps.yaml file with imputationserver and hapmap2
ADD apps.yaml /opt/cloudgene/apps.yaml

# Imputation Server Branding
ENV CLOUDGENE_SERVICE_NAME="Michigan Imputation Server"
ENV CLOUDGENE_HELP_PAGE="http://imputationserver.readthedocs.io"
ENV CLOUDGENE_REPOSITORY="/opt/cloudgene/apps.yaml"

# run startup script to start Hadoop and Cloudgene
CMD ["/usr/bin/startup"]
