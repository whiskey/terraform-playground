# encoding: utf-8
# copyright: 2018, Carsten Knoblich

title 'sample section'

# load data from terraform output
content = inspec.profile.file("terraform.json")
params = JSON.parse(content)

INTANCE_ID = params['ec2_id']['value']
VPC_ID = params['vpc_id']['value']


# test networking
describe aws_vpc(vpc_id: VPC_ID) do
  its('cidr_block') { should cmp '10.101.0.0/16' }
end

describe aws_security_group(group_name: 'web_access') do
  it { should exist }
  its('group_name') { should eq 'web_access' }
  its('vpc_id') { should eq VPC_ID }
end

describe aws_security_group(group_name: 'ssh_access') do
  it { should exist }
  its('group_name') { should eq 'ssh_access' }
  its('vpc_id') { should eq VPC_ID }
end

# test computing
describe aws_ec2_instance(INTANCE_ID) do
  it { should be_running }
  its('instance_type') { should eq 't2.micro' }
  its('image_id') { should eq 'ami-fa2fb595' }
end

# test database
# TODO: ...
