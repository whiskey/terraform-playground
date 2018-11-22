# encoding: utf-8
# copyright: 2018, Carsten Knoblich

title 'sample section'

# load data from terraform output
content = inspec.profile.file("terraform.json")
params = JSON.parse(content)

INTANCE_ID = params['ec2_id']['value']
VPC_ID = params['vpc_id']['value']

PUBLIC_SUBNET_ID = params['vpc_public_subnet_id']['value']
PRIVATE_SUBNET_ID = params['vpc_private_subnet_id']['value']

# test networking
describe aws_vpc(vpc_id: VPC_ID) do
	it { should exist }
  its('cidr_block') { should cmp '10.101.0.0/16' }
end

describe aws_subnet(subnet_id: PUBLIC_SUBNET_ID) do
	it { should exist }
	it { should be_mapping_public_ip_on_launch }
end

describe aws_subnet(subnet_id: PRIVATE_SUBNET_ID) do
	it { should exist }
	it { should_not be_mapping_public_ip_on_launch }
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
  #TODO: its('image_id') { should eq 'ami-fa2fb595' }
end

# test database
# TODO: ...
