require './lib/bike.rb'

describe Bike do
    it { is_expected.to respond_to :broken? }

    describe '#broken?' do
        it 'returns false if the bike is not broken' do
            expect(subject.broken?).to eq false
        end

        it 'returns true if the bike is broken' do
            subject.report_broken
            expect(subject.broken?).to eq true
        end
    end

    describe '#report_broken' do
        it "allows a user to report a bike as not working" do
            subject.report_broken
            expect(subject.broken?).to eq true
        end    
    end

end