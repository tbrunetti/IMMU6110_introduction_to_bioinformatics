# IMMU6110_introduction_to_bioinformatics
CU Anschutz Course IMMU6110, introduction to bioinformatics for Department of Immunology and Microbiology

## Containers
**Docker**  
1.  Install Docker on your local system  

2.  Pull the Docker image by running the following command:  
```
docker pull tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```  
3.  Run the container by running the following line and then opening your web browser to localhost:8787.  Username:rstudio
```
docker run -e -p 8787:8787 PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```

**Singularity**

