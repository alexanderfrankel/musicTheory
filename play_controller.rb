require_relative 'frequency_finder'
require_relative 'sample'
require_relative 'wavefile'

cool = FrequencyFinder.new(880.0)
play = cool.modes

a = Sample.new(play)

Wav.write(a.get_samples)
Wav.play