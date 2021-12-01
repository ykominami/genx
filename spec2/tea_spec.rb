class Tea
	def flavor
		'earl gray'
	end

	def temperature
		250
	end
end

RSpec.configure do |config|
	config.example_status_persistence_file_path = 'spec/example.txt'
end

RSpec.describe Tea do
	let(:tea) { Tea.new }	

	it 'tastes like Earl Gray' do
		expect(tea.flavor).to eq('earl gray')
	end

	it 'is hot' do
		expect(tea.temperature).to be > 200.0
	end
end