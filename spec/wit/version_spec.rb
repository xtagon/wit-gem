require 'spec_helper'

describe Wit::VERSION do
	it('is a valid version string') { should =~ /\A\d+\.\d+\.\d+(-\w+)?\Z/ }
end
