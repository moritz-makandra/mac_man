require 'rspec'

require_relative '../lib/mac_man/address'

describe MacMan::Address do
  describe 'with prefix' do
    subject { described_class.new(oui: 0xAB_CD_EF) }

    it 'starts with specified prefix' do
      expect(subject.to_s).to start_with "ab:cd:ef"
    end
  end

  describe '.to_s ' do
    subject { described_class.new }

    it 'is a valid mac address' do
      expect( subject.to_s ).to match(/^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$/)
    end
  end

  describe '.broadcast_address?' do
    subject { described_class.new(address: 0xFF_00_00_00_00_00)}

    it 'is true' do
      expect(subject.broadcast_address?).to eq true
    end
  end

  describe '.locallly_administered?' do
    subject { described_class.new(address: 0xF2_00_00_00_00_00)}

    it 'is true' do
      expect(subject.locally_administered?).to eq true
    end
  end

  describe '.set_locally_administered_bit' do
    subject { MacMan::Address.new(address:0x00_00_00_00_00_00).set_locally_administered_bit }

    it 'has the locally administered bit set' do
      expect(subject).to eq 0x02_00_00_00_00_00
    end
  end

  describe '.unset_broadcast_bit' do
    subject { MacMan::Address.new(address: 0xFF_00_00_00_00_00).unset_broadcast_bit }

    it 'has the boradcast bit unset' do
      expect(subject).to eq 0xFE_00_00_00_00_00
    end
  end

  describe '#to_hex' do
    subject { described_class.new(address: 0xAB_CD_EF_12_34_56)}

    it 'is delimited by colons' do
      expect(subject.to_hex).to eq 'ab:cd:ef:12:34:56'
    end

    it 'is delimited by dashes' do
      expect(subject.to_hex(delimiter: '-')).to eq 'ab-cd-ef-12-34-56'
    end
  end
end
