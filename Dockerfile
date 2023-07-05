FROM broadinstitute/picard:2.27.5
# OS: 20.04.3 LTS (Ubuntu Focal Fossa)
# 20230705 needed to install magrittr so picard doesn't throw error

RUN \
  apt-get update && \
  apt-get install -y make && \
  apt-get install -y gcc && \
  apt-get clean

RUN R -e "install.packages('magrittr', ref='2.0.3')"
