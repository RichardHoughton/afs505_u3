#!/usr/bin/env nextflow
 
Channel
  .fromPath('/data/ficklin_class/AFS505/course_material/data/all.pep')
  .splitFasta(by : 5000, file:true)
  .set { fasta_split }

process blast {

  input:
  path 'query' from fasta_split

  output:
  file 'results' into fasta_results 

  " blastp -query $query -db /data/ficklin_class/AFS505/course_material/data/swissprot -outfmt 6 -num_threads ${task.cpus} -evalue 1e-6 > results " 
}
   
fasta_results
  .collectFile(name: 'fasta_results.txt') 
