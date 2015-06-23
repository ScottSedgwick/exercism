# Solution for Exercism Ruby Food Chain exercise.
class FoodChainSong
  PTN_ONE = 'I know an old lady who swallowed a %s.'
  PTN_END = 'I don\'t know why she swallowed the fly. Perhaps she\'ll die.'
  PTN_WHY = 'She swallowed the %s to catch the %s'
  PTN_WHY_STD = PTN_WHY + '.'
  PTN_WRIGGLE = 'wriggled and jiggled and tickled inside her.'
  VERSE_INFO = [
    { critter: 'fly' },
    { critter: 'spider',
      exclamation: 'It ' + PTN_WRIGGLE,
      reason: PTN_WHY_STD },
    { critter: 'bird',
      exclamation: 'How absurd to swallow a %s!',
      reason: PTN_WHY + ' that ' + PTN_WRIGGLE },
    { critter: 'cat',
      exclamation: 'Imagine that, to swallow a %s!',
      reason: PTN_WHY_STD },
    { critter: 'dog',
      exclamation: 'What a hog, to swallow a %s!',
      reason: PTN_WHY_STD },
    { critter: 'goat',
      exclamation: 'Just opened her throat and swallowed a %s!',
      reason: PTN_WHY_STD },
    { critter: 'cow',
      exclamation: 'I don\'t know how she swallowed a %s!',
      reason: PTN_WHY_STD },
    { critter: 'horse',
      exclamation: 'She\'s dead, of course!' }
  ]

  def verse(n)
    result = opening(n - 1)
    return result.join("\n") + "\n" if (n == 8)
    (n - 1).downto(0) { |m| result << reason(m) if VERSE_INFO[m].key?(:reason) }
    (result << PTN_END).join("\n") + "\n"
  end

  def verses(start, finish)
    start.upto(finish).map { |n| verse(n) }.join("\n") + "\n"
  end

  def sing
    verses(1, 8)
  end

  private

  def opening(n)
    vinfo = VERSE_INFO[n]
    result = [format(PTN_ONE, vinfo[:critter])]
    if vinfo.key?(:exclamation)
      result << format(vinfo[:exclamation], vinfo[:critter])
    else
      result
    end
  end

  def reason(n)
    format(VERSE_INFO[n][:reason],
           VERSE_INFO[n][:critter],
           VERSE_INFO[n - 1][:critter])
  end
end
