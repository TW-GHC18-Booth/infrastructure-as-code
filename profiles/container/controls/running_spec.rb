control 'test-container-1.0' do
    impact 1.0
    title 'Test Container'
    desc 'Docker Container test-ghc-infra-hello should be running.'
    describe docker_container(name: 'test-ghc-infra-hello') do
        it { should exist }
        it { should be_running }
        its('image') { should eq 'ghc-infra-hello:latest' }
        its('ports') { should eq '0.0.0.0:5000->80/tcp' }
    end
end
