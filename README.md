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
docker run --rm -p 8787:8787 -e PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```

4.  If you would like to mount the hard drive we have provided for class, please modify the above command to include the -v option.  This is mostly only useful for the Linux/Bash/Shell days.  
```
docker run -v /path/to/hard/drive:/home --rm -p 8787:8787 -e PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```

**Singularity**

