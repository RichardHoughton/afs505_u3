This GitHub has all the needed files to run AFS 505 Project 3.  

Directions:

   1. Download all of the required files.  
   2. From the command line, run the line of code sbatch projectSLURM.sh.  This script will add java, blast, and nextflow, so no steps are   
      needed prior to this.
     - There are lines within this SLURM script that set an email address to send notifications when the job is finished.  Before 
       running the       
       script, you should edit the script to either remove these lines or edit them to match your email address.  You should also go inside of
       the Nextflow script project.nf if you plan on running a different file using the same code.  Instructions on what needs to be changed 
       will be in that file.  If you plan on running more cpus than 5, go into the nextflow.config and change the cpus under blast to whatever 
       you need.
   3. Once the script is running, you will get a notification when it starts and then another notification once the job finishes. This will 
      take somehwere between 5 and 5 1/2 hours. 
   4. Run the line find -name "fasta_results.txt" or whatever you have changed that line to in order to find where that file was saved within 
      the work directory.  
   5. Either move the file generated by projectSLURM.sh to the same directory as projectStep2Script.sh or vice versa. 
   6. Run the line of code sbatch projectStep2Script.sh to take the output file and split it into two columns, one with the gene name and the 
      other with the amount of times that gene shows up in the file.
      
