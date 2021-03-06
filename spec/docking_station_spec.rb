require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double(:bike, broken?: false)
    subject.dock bike
    expect(subject.release_bike).to be bike
  end


  it 'does not release broken bikes' do
    bike = double(:bike)
    allow(bike).to receive(:broken?).and_return(true)
    subject.dock bike
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }


  describe '#release_bike' do
    it 'release a bike' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bike available' do
      expect { subject.release_bike}.to raise_error 'No bikes available'
      end
    end

  describe '#dock' do
    it 'raises an error when docking station is full' do
      subject.capacity.times {subject.dock double :bike }
      expect { subject.dock double(:bike) }.to raise_error "Docking station full"
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
