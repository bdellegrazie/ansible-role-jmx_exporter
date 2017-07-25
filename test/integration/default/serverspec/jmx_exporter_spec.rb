require 'spec_helper'

describe file('/opt/prometheus/exporters/jmx_prometheus_javaagent.jar') do
  it { should be_symlink }
end
