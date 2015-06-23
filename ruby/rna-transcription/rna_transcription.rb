# Solution for Exercism RNA Transcription problem.
module Complement
  def self.of_dna(rna)
    rna.chars.each_with_object([]) do |c, dna|
      fail ArgumentError unless DNA_TO_RNA.key? c
      dna << DNA_TO_RNA[c]
    end.join
  end

  def self.of_rna(dna)
    dna.chars.each_with_object([]) do |c, rna|
      fail ArgumentError unless RNA_TO_DNA.key? c
      rna << RNA_TO_DNA[c]
    end.join
  end

  private

  DNA_TO_RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  RNA_TO_DNA = DNA_TO_RNA.invert
end
