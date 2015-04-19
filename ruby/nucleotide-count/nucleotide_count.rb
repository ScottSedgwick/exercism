# Solution for Exercism Nucleotid Count problem.
class Nucleotide
  def initialize(dna)
    throw ArgumentError.new unless valid_dna?(dna)
    @dna = dna
  end

  def count(nucleotide)
    throw ArgumentError.new unless valid_nucleotide?(nucleotide)
    @dna.count(nucleotide)
  end

  def histogram
    VALID_DNA.chars.each_with_object({}) do |nucleotide, counts|
      counts[nucleotide] = count(nucleotide)
    end
  end

  def self.from_dna(dna)
    Nucleotide.new(dna)
  end

  private

  VALID_DNA = 'ATCG'
  VALID_NUCLEOTIDE = VALID_DNA + 'U'

  def valid_dna?(dna)
    dna.chars.all? { |c| VALID_DNA.include?(c) }
  end

  def valid_nucleotide?(nucleotide)
    VALID_NUCLEOTIDE.include?(nucleotide)
  end
end
