#!/usr/bin/env nextflow
 
/*
 The first line of this Nextflow establishes the file being pulled in.  Set this line to whatever FASTA file that you are wanting to split.
 The next line tells Nextflow to split the FASTA file into chunks of 5000 FASTA sequences in different files through the argument file:true.
 Finally, we set the output to the channel fasta_split, which will be used in the next process.
 */
  
Channel
  .fromPath('/data/ficklin_class/AFS505/course_material/data/all.pep') 
  .splitFasta(by : 5000, file:true)
  .set { fasta_split }

/*
 This process works to blast all the files from the above section, creates files for each blast, and save them into a new channel.  
 We set the input of this process to pull our files from fasta_split and puts them in the path 'query'.  We then run blast setting the query 
 as the files from the above channel, the database as needed (this should be changed to whatever database you are using if you want to use
 this code for a different dataset), the output format to tab-delimited (6), the number of threads equal to the cpus specified in the 
 nextflow.config file, and the e-value threshold to 1e-6.  We then save these blasted files to 'results', which we then forward into the channel
 fasta_results. 
  */

process blast {

  input:
  path 'query' from fasta_split

  output:
  file 'results' into fasta_results 

  " blastp -query $query -db /data/ficklin_class/AFS505/course_material/data/swissprot -outfmt 6 -num_threads ${task.cpus} -evalue 1e-6 > results " 
}
   
/*
 Finally, we take the channel fasta_results and use collectFile in order to take all the output files from the channel into a file named 
 fasta_results.txt (This can be changed to whatever name needed for the output of a different file.)
   
fasta_results
  .collectFile(name: 'fasta_results.txt') 
