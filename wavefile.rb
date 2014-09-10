require 'wavefile'

class Wav

	def self.write(samples, sample_rate = 22050, filename = 'a.wav')
		buffer_format = WaveFile::Format.new(:mono, :float, sample_rate)
		buffer = WaveFile::Buffer.new(samples, buffer_format)
		format = WaveFile::Format.new(:mono, :pcm_16, sample_rate)

		WaveFile::Writer.new(filename, format) do |writer|
			writer.write buffer
		end
	end

	def self.play(filename = 'a.wav')
		`afplay #{filename}`
	end
end