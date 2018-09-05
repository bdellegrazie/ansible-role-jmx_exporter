control 'jmx_exporter' do
  title 'Prometheus JMX Exporter'
  impact 1.0
  desc '
    Ensure Java Exporter is available
  '

  describe file('/opt/prometheus/exporters/jmx_prometheus_javaagent.jar') do
    it { should be_symlink }
  end

  javaagent_target = file('/opt/prometheus/exporters/jmx_prometheus_javaagent.jar').link_path
  describe file(javaagent_target) do
    it { should exist }
    it { should be_file }
    its('basename') { should match(/javaagent/) }
  end

end
