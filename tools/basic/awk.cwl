#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: awk
description: AWK command

requirements:
  InlineJavascriptRequirement: {}

hints:
  - $import: ubuntu.yml

inputs:
  F:
    type: string?
    description: Awk separator
    inputBinding:
      position: 1
      prefix: -F

  text:
    type: string
    description: Awk text
    inputBinding:
      position: 2
  file:
    type: File
    description: Input file
    inputBinding:
      position: 3
  outFileName:
    type: string
    description: Out put file name

outputs:
  output:
    type: stdout

stdout: $(inputs.outFileName)

baseCommand: ["awk"]

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-4108-5982
    s:email: mailto:r78v10a07@gmail.com
    s:name: Roberto Vera Alvarez

s:license: https://spdx.org/licenses/OPL-1.0

$namespaces:
  s: http://schema.org/

$schemas:
  - http://schema.org/docs/schema_org_rdfa.html

