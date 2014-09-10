class Sample

	def self.create(frequencies = [440.0], sample_rate = 22050, duration = 1.0)
		@frequencies = frequencies
		@sample_rate = sample_rate
		@duration = duration
		get_samples
	end

	private

	def self.get_samples
		samples = []

		@frequencies.each do |frequency|
			phase = 0
			total_frames.times do
				samples << Math.sin(phase)
				phase += increment(frequency)
			end
		end
		samples
	end

	def self.total_frames
		(@duration * @sample_rate).to_i
	end

	def self.cycles_per_frame(frequency)
		frequency / @sample_rate
	end

	def self.increment(frequency)
		2 * Math::PI * cycles_per_frame(frequency)
	end
end

