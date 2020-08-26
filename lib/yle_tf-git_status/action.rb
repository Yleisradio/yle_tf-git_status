# frozen_string_literal: true

require 'yle_tf/error'
require 'yle_tf/logger'
require 'yle_tf/system'

module YleTfPlugins
  module GitStatus
    class Action
      def initialize(app, **config)
        @app = app
        @action_config = config
      end

      def git_status
        YleTf::System.read_cmd('git', 'status', '--porcelain').split("\n")
      end

      def number_of_files(lines, prefix)
        lines.select { |m| m.start_with?(prefix) }.length
      end

      def report(status)
        msg = ' files in local git repository'
        modified = number_of_files(status, ' M') + number_of_files(status, 'M ')
        YleTf::Logger.warn("#{modified} modified#{msg}") if modified.positive?
        untracked = number_of_files(status, '??')
        YleTf::Logger.warn("#{untracked} untracked#{msg}") if untracked.positive?
        unknown = status.length - modified - untracked
        if unknown.positive?
          YleTf::Logger.error("#{unknown}#{msg} which status is unknown to yle_tf")
        end
      end

      def call(env)
        return @app.call(env) if env[:tf_command] != 'apply'

        # fetch git status, before yle_tf does chdir to tmpdir
        status = git_status
        @app.call(env)
        # report results after terraform has done exit
        report(status) if !status.empty?
      end
    end
  end
end
