# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yle_tf-git_status/version'

Gem::Specification.new do |spec|
  spec.name        = 'yle_tf-git_status'
  spec.version     = YleTfPlugins::GitStatus::VERSION
  spec.summary     = 'A plugin for yle_tf for checking git status after tf apply'
  spec.description = spec.summary
  spec.homepage    = 'https://github.com/Yleisradio/yle_tf-git_status'
  spec.license     = 'MIT'

  spec.authors = [
    'Yleisradio',
  ]
  spec.email = [
    'devops@yle.fi',
  ]
end
