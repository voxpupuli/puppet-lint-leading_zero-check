Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-leading_zero-check'
  spec.version     = '1.1.0'
  spec.homepage    = 'https://github.com/voxpupuli/puppet-lint-leading_zero-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Vox Pupuli'
  spec.email       = 'voxpupuli@groups.io'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.summary     = 'A puppet-lint plugin to check for unquoted numbers with leading zero.'
  spec.description = <<-EOF
    A puppet-lint plugin to check for unquoted numbers with leading zero.
  EOF

  spec.required_ruby_version = '>= 2.7.0'

  spec.add_dependency 'puppet-lint', '>= 3', '< 5'
end
