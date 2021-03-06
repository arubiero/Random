# # encoding: utf-8

# Inspec test for recipe dns-server::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('named') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe file('/etc/motd') do
  its('content') {should match 'DNS-SERVER'}
end

describe port(53) do
  its ('processes') {should include 'named'}
end
