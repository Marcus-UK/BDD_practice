require './lib/bike.rb'

describe Bike do
    it { is_expected.to respond_to :working? }

    describe '#working?' do
        it 'returns true if the bike is working' do
            expect(subject.working?).to eq true
        end

        it 'returns false if the bike is not working' do
            subject.report_broken
            expect(subject.working?).to eq false
        end
    end

    describe '#report_broken' do
        it "allows a user to report a bike as not working" do
            subject.report_broken
            expect(subject.working?).to eq false
        end    
    end

end