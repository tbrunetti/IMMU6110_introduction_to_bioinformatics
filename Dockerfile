FROM rocker/rstudio:4.1.0

RUN printf 'deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted\n\
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted\n\
deb-src http://archive.ubuntu.com/ubuntu/ focal universe\n\
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates universe\n' >> /etc/apt/sources.list


RUN apt -y update && apt -y dist-upgrade

RUN apt -y update && apt -y install build-essential libcurl4-gnutls-dev libxml2-dev

RUN apt -y update && apt -y install curl locales locales-all bash tar gzip libxml2-dev zlib1g-dev libssl-dev wget

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
        && locale-gen en_US.utf8 \
        && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt -y update && apt -y install libgit2-dev

# Install R packages
RUN install2.r --error \
	R.utils \
	zip \
	cli \
	DT \
	usethis \
	devtools \
	remotes \
	caTools \
	googlesheets4 \
	lubridate \
	stringi \
	tidyverse \
	cowplot \
	RCurl \
	scales \
	gridExtra \
	ggpubr \
	rmarkdown \
	tinytex \
	fastqcr \
	GGally \
	matrixStats \
	BiocManager \
	msigdbr \
	pheatmap \
	viridis
 

RUN R -e 'require(remotes); install_version("matrixStats", version = "0.61.0", repos = "http://cran.us.r-project.org")'


# Install BiocManager packages	
#RUN installBioc.r \
#	multtest \
#	SingleCellExperiment \
#	Seurat \
#	AnnotationHub \
#	AnnotationFilter \
#	AnnotationDbi \
#	zellkonverter \
#	Rsubread \
#	seqTools \
#	S4Vectors \
#	IRanges \
#	GenomicRanges \
#	SummarizedExperiment \
#	DESeq2 

RUN R -e 'BiocManager::install("multtest")'
RUN R -e 'BiocManager::install("MatrixGenerics")'
RUN R -e 'BiocManager::install("SingleCellExperiment")'
RUN R -e 'BiocManager::install("Seurat")'
RUN R -e 'BiocManager::install("AnnotationDbi")'
RUN R -e 'BiocManager::install("AnnotationHub")'
RUN R -e 'BiocManager::install("AnnotationFilter")'
RUN R -e 'BiocManager::install("zellkonverter")'
RUN R -e 'BiocManager::install("Rsubread")'
RUN R -e 'BiocManager::install("seqTools")'
RUN R -e 'BiocManager::install("S4Vectors")'
RUN R -e 'BiocManager::install("IRanges")'
RUN R -e 'BiocManager::install("GenomicRanges")'
RUN R -e 'BiocManager::install("SummarizedExperiment")'
RUN R -e 'BiocManager::install("DESeq2")'
RUN R -e 'BiocManager::install("org.Hs.eg.db")'
RUN R -e 'BiocManager::install("org.Mm.eg.db")'
RUN R -e 'BiocManager::install("GO.db")'
RUN R -e 'BiocManager::install("DO.db")'
RUN R -e 'library(devtools); devtools::install_github("YuLab-SMU/yulab.utils")'
RUN R -e 'library(devtools); devtools::install_github("YuLab-SMU/ggtree")'
RUN R -e 'install.packages("shadowtext")'
#RUN R -e 'BiocManager::install("enrichplot")'
#RUN R -e 'BiocManager::install("clusterProfiler")'
#RUN R -e 'library(devtools); devtools::install_github("YuLab-SMU/enrichplot")'
#RUN R -e 'library(devtools); devtools::install_github("YuLab-SMU/clusterProfiler")'
#RUN R -e 'BiocManager::install("clusterProfiler")'
#RUN R -e 'source("https://bioconductor.org/biocLite.R"); BiocInstaller::biocLite("clusterProfiler")'

RUN apt-get update && apt-get -y install git libgdal-dev libnlopt-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxslt1-dev qt5-default mesa-utils libgl1-mesa-glx libgl1-mesa-dev

RUN apt-get update && apt-get -y install build-essential libglpk40
RUN R -e "install.packages('igraph', dependencies = T)"

RUN R -e 'BiocManager::install("enrichplot")'
RUN R -e 'BiocManager::install("clusterProfiler")'


RUN R --no-echo -e 'library(remotes); library(SingleCellExperiment); remotes::install_github("satijalab/seurat-wrappers")'
RUN R --no-echo -e 'library(remotes); remotes::install_github("immunogenomics/harmony")'
RUN R --no-echo -e 'library(remotes); remotes::install_github("YosefLab/VISION")'

RUN apt-get install -y openssl
RUN R --no-echo -e 'library(tinytex); tinytex::install_tinytex(repository = "http://mirrors.tuna.tsinghua.edu.cn/CTAN/", version = "latest")'


RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
#RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt update
RUN apt-get -y install python3.8
RUN apt-get -y  install python3-pip
RUN pip3 install multiqc

RUN wget https://sourceforge.net/projects/bbmap/files/BBMap_38.92.tar.gz && tar -zxvf BBMap_38.92.tar.gz && cd bbmap && mv * /usr/local/bin/ && cd ../

RUN apt-get install -y default-jre

RUN git clone https://github.com/broadinstitute/picard.git && cd picard && ./gradlew shadowJar && cp build/libs/picard.jar /usr/local/bin/ && ./gradlew clean

RUN apt -y update && apt -y dist-upgrade

RUN apt-get -y install nano

RUN apt-get -y install vim

RUN apt -y update && apt -y dist-upgrade


RUN date > /build-date

