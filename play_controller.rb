require_relative 'frequency_finder'
require_relative 'sample'
require_relative 'wavefile'

new_frequency = FrequencyFinder.new(880.0)
mode_frequencies = new_frequency.modes

a = Sample.create(mode_frequencies)

Wav.write(a)
Wav.play