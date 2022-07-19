class: CommandLineTool
cwlVersion: v1.0

label: gatk-HaplotypeCaller
doc: GATK suite

hints:
  - $import: gatk-docker.yml
  - $import: gatk-bioconda.yml

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    coresMin: $(inputs.threads)
    ramMin: 8000
    ramMax: 16000

inputs:
  I:
    type: File
    secondaryFiles: [.bai, .sbi]
    inputBinding:
      position: 1
      prefix: -I
  R:
    type: File
    secondaryFiles: [.fai, ^.dict]
    inputBinding:
      position: 2
      prefix: -R
  O:
    type: string
    inputBinding:
      position: 3
      prefix: -O
  threads:
    type: int
    inputBinding:
      position: 4
      prefix: --native-pair-hmm-threads
  intervals:
    type: string?
    inputBinding:
      position: 5
      prefix: --intervals

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.O)

baseCommand: [gatk, HaplotypeCaller]

$namespaces:
  s: http://schema.org/

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-4108-5982
    s:email: mailto:r78v10a07@gmail.com
    s:name: Roberto Vera Alvarez
$schemas:
  - https://schema.org/version/latest/schemaorg-current-http.rdf
