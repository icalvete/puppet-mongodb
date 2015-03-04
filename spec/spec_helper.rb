require 'rspec-puppet'

# This will make stdlib functions available when test examples will run
$:.unshift File.join(File.dirname(__FILE__),  'fixtures', 'modules', 'stdlib', 'lib')

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
    c.module_path = File.join(fixture_path, 'modules')
    c.manifest_dir = File.join(fixture_path, 'manifests')
    c.hiera_config = File.join(fixture_path, 'hiera/hiera.yaml')
end
