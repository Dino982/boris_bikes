require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#dock' do

    # it 'returns docked bikes' do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect(subject.bike).to eq bike
    # end

    it 'raises an error when docking station is full' do
      subject.capacity.times {subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end


  describe '#release_bike' do

    it 'release a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bike available' do
      expect { subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) {Bike.new}
    it 'defaults capacity'do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect {subject.dock(bike)}.to raise_error "Docking station full"
    end
  end
end
