control "test-ghc-infra-hello-depedencies-1.0" do
    impact 1.0
    title "Container Should Have Application Dependencies Installed"
    desc "Container Should Have Application Dependencies Installed"

    describe command('nginx -v') do
        its('stderr') { should include '1.15.2' }
    end

    describe command('curl --version') do
        its('stdout') { should include '7.61.0' }
    end
end
