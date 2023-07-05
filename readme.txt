picard_collect_rna_seq_metrics was failing with an error that the package magrittr didn't exist.  This is an error from picard's scripts, not one of ours.  This shouldn't happen because the image hadn't changed and it used to work.  The same command, files, and container ran fine locally using docker, but would complain about missing magrittr using singularity apptainer.

I made a new Dockerfile & image by wrapping the Broad's with an added magrittr installation (plus the required make & gcc).  This new image worked fine on apptainer, so problem solved.  This seems to indicate that, however they installed magrittr in their Dockerfile, it was only accessible to root (docker) and not USER (apptainer).

The really odd part about this explanation is that both docker and apptainer said magrittr wasn't installed when running R -e "library('magrittr')" from the command line within the containers.  That should have the same root vs USER access problem as when running the whole picard script.  Anyways problem solved so moving on... 

Decoding the tag structure
v.w.x.y 
vwx is the version of the broad image.  
y is the version of this Dockerfile.  