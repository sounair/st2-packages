require 'serverspec'

set :backend, :exec

shared_examples 'script or binary' do
  it { is_expected.to be_file & be_executable }

  shebang = /^#!(?<interpreter>.*?)$/m
  if described_class.content.match(shebang)
    describe file(Regexp.last_match[:interpreter]) do
      it { is_expected.to be_file & be_executable }
    end
  end
end
