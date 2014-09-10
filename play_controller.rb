require_relative 'frequency_finder'
require_relative 'sample'
require_relative 'wavefile'

new_frequency = FrequencyFinder.new(220.0)
third_frequencies = new_frequency.arpeggio

a = Sample.create(third_frequencies)

Wav.write(a)
Wav.play