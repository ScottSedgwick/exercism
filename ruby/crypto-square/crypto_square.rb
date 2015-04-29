# Solution for Exercism Ruby Crypto Square problem.
class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    a = plaintext_segments
    r = Array.new(size, '')
    size.times do |i|
      a.each { |l| r[i] += l[i] if l[i] }
    end
    r.join('')
  end

  def normalize_ciphertext
    chunk(ciphertext, plaintext_segments.length).join(' ')
  end

  def normalize_plaintext
    @plaintext.downcase.delete('^a-z0-9')
  end

  def plaintext_segments
    chunk(normalize_plaintext, size)
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  private

  def chunk(text, len)
    text.scan(/.{1,#{len}}/)
  end
end
