control 'jmx_exporter_httpserver' do
  title 'Prometheus JMX Exporter HTTP Server'
  impact 1.0
  desc '
    Ensure Java Exporter HTTP Server is available
  '

  describe file('/opt/prometheus/exporters/jmx_prometheus_httpserver.jar') do
    it { should be_symlink }
  end

  httpserver_target = file('/opt/prometheus/exporters/jmx_prometheus_httpserver.jar').link_path
  describe file(httpserver_target) do
    it { should exist }
    it { should be_file }
    its('basename') { should match(/httpserver/) }
  end

  describe port(5556) do
    it { should be_listening }
  end

  describe service('jmx_exporter_httpserver') do
    it { should be_enabled }
    it { should be_running }
  end

  describe http('http://localhost:5556/metrics', open_timeout: 10, read_timemout: 10) do
    its('status') { should eq 200 }
    its('body') { should match(/jmx_scrape_duration_seconds/) }
  end

end
