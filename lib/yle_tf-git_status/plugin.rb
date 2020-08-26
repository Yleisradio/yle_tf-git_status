# frozen_string_literal: true

require 'yle_tf'

module YleTfPlugins
  module GitStatus
    class Plugin < YleTf::Plugin
      register

      action_hook do |hook|
        require_relative 'action'
        hook.before(YleTf::Action::TmpDir, Action)
      end
    end
  end
end
