require File.dirname(__FILE__) + '/../../../lib/core/project'
require File.dirname(__FILE__) + '/../../../lib/core/configuration'

module Gator
  def self.set_argv(args)
    ARGV.length.times do |i|
      ARGV.delete_at i
    end
    args.length.times do |i|
      ARGV[i] = args[i]
    end
  end

  module CLI
    class Application

      def initialize
        self
      end

      def execute(args)
        raise "No command specified." if args.empty?
        command = args.shift
        raise "Command: \"#{command}\" could not be found." unless Gator::Command.has?(command)
        args << "--help" if args.empty?
        Gator::Command.get(command).start args
      end

      def shell
        @shell ||= Shell.new
      end

    end
  end
  class << self

    attr_accessor :application

    def shell
      application.shell
    end

  end

  self.application= Gator::CLI::Application.new
end