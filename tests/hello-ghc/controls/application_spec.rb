control "test-ghc-infra-hello-1.0" do
    impact 1.0
    title "Application Page Content Should Be Copied to Container"
    desc "Application Page Content Should Be Copied to Container"

    describe directory('/usr/share/nginx/html/fonts') do
        it { should exist }
    end

    describe file('/usr/share/nginx/html/fonts/OpenSans-Regular.ttf') do
        it { should exist }
    end

    describe directory('/usr/share/nginx/html/images') do
        it { should exist }
    end

    describe file('/usr/share/nginx/html/images/tw_logo.png') do
        it { should exist }
    end

    describe file('/usr/share/nginx/html/index.html') do
        it { should exist }
        its('content') { should include 'Hello, Grace Hopper Celebration!' }
    end

    describe http('http://localhost') do
        its('status') { should eq 200 }
        its('body') { should include 'Hello, Grace Hopper Celebration!' }
    end
end