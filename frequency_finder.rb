class FrequencyFinder

	TWELTH_ROOT_OF_TWO = (2 ** (1.0/12))

	TONE = 2
	SEMI_TONE = 1
	MAJOR_SCALE_PATTERN = [TONE, TONE, SEMI_TONE, TONE, TONE, TONE, SEMI_TONE]
	MINOR_SCALE_PATTERN = [TONE, SEMI_TONE, TONE, TONE, SEMI_TONE, TONE, TONE]

	def initialize(base_frequency = 440.0)
		@base_frequency = base_frequency
	end

	def octave_up(number = 1)
		[@base_frequency * (2 * number)]
	end

	def octave_down(number = 1)
		[@base_frequency / (2 * number)]
	end

	def chromatic(number = 12)
		chromatic_frequencies = [@base_frequency]
		current = @base_frequency
		number.times do
			current *= TWELTH_ROOT_OF_TWO
			chromatic_frequencies << current
		end
		chromatic_frequencies
	end

	def major_scale
		major_frequencies = [@base_frequency]
		chromatic_frequencies = chromatic
		current = 0
		MAJOR_SCALE_PATTERN.each do |interval|
			current += interval
			major_frequencies << chromatic_frequencies[current]
		end
		major_frequencies
	end

	def minor_scale
		minor_frequencies = [@base_frequency]
		chromatic_frequencies = chromatic
		current = 0
		MINOR_SCALE_PATTERN.each do |interval|
			current += interval
			minor_frequencies << chromatic_frequencies[current]
		end
		minor_frequencies
	end

	def modes(current_mode = MAJOR_SCALE_PATTERN)
		mode_notes = []
		current_start = 0
		chromatic_frequencies = chromatic(24)

		8.times do
			current = current_start
			mode_frequencies = [chromatic_frequencies[current]]
			current_mode.each do |interval|
				current += interval
				mode_frequencies << chromatic_frequencies[current]
			end

			mode_notes += mode_frequencies
			current_start += current_mode.first

			current_mode.rotate!
		end
		mode_notes
	end

	def arpeggio(current_mode = MAJOR_SCALE_PATTERN)
		current_mode *= 2
		current = 0
		chromatic_frequencies = chromatic(24)

		arpeggio = [chromatic_frequencies.first]

		current_mode.each_slice(2) do |group|
			current += group.inject(:+)
			arpeggio << chromatic_frequencies[current]
		end
		arpeggio
	end
end
