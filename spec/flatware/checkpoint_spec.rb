require 'spec_helper'
describe Flatware::Cucumber::Checkpoint do
  let(:checkpoint) { described_class.new [], scenarios }

  describe "#failures?" do
    subject { checkpoint.failures? }

    context "when all scenarios passed" do
      let :scenarios do
        [
          double('scenario',
            status: :passed,
            file_colon_line: nil,
            name: nil,
            exception: nil
          )
        ]
      end

      it { should_not be }
    end

    context "when any scenarios failed" do
      let :scenarios do
        [
          double('scenario',
            status: :failed,
            file_colon_line: nil,
            name: nil,
            exception: nil
          )
        ]
      end

      it { should be }
    end
  end
end
