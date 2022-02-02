# IMMU6110_introduction_to_bioinformatics
CU Anschutz Course IMMU6110, introduction to bioinformatics for Department of Immunology and Microbiology

## Containers
**Docker**  
1.  Install Docker on your local system  

2.  Pull the Docker image by running the following command:  
```
docker pull tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```  

* If you want to run rstudio, please follow step 3 only  
* If you want to run bash/shell/Linux inside a container skip step 3 and go directly to step4.  


** For Rstudio Days run just step 3 **  

3.  Run the container by running the following line and then opening your web browser to localhost:8787.  Username:rstudio
```
docker run -v /path/to/hard/drive --rm -p 8787:8787 -e PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```
**Windows Users:**
the path following the `-v` argument likely maps to your `D:` drive, so for step 3, your command will look like the following:  

```
docker run -v d:/ --rm -p 8787:8787 -e PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```  

**Mac Users:**
the path following the `-v` argument likely maps to your `Volumes` directory with the name of the hard drive at the top most level, so for step 3, your command will look like the following:
```
docker run -v /Volumes/Samsung_T5/ --rm -p 8787:8787 -e PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```


** For Linux Days run just step 4 **
4.  If you would like to mount the hard drive we have provided for class, please modify the above command to include the -v option.  This is mostly only useful for the Linux/Bash/Shell days.  
```
docker run -v /path/to/hard/drive:/home --rm -p 8787:8787 -e PASSWORD=<yourpasswordhere> tbrunetti/immu6110_introduction_to_bioinformatics:v01.2022
```  

**Singularity**

