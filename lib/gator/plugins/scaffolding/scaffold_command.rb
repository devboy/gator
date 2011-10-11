require "thor"
require "thor/actions"
require "fileutils"

class Gator
  module Scaffolding
    class ScaffoldCommand < Command
      include Thor::Actions

      define :command => "scaffold", :short => "s",
             :usage => "scaffold TASK", :description => "Set of tasks to manage scaffold templates."

      def self.source_root
        Gator::Scaffolding::ScaffoldingFileUtils.new.scaffolds_home
      end

      desc "scaffold install NAME TEMPLATE_NAME", "Install a scaffold template."
      def install(dir, name=nil)
        entries = file_util.directory_entries dir
        name ||= file_util.last_directory_name dir
        install_dir = file_util.scaffold_directory(name)
        empty_directory install_dir
        FileUtils.cp_r entries, install_dir
        file_util.create_empty_directory_files install_dir
      end

      desc "scaffold uninstall TEMPLATE_NAME", "Uninstall a scaffold template."
      def uninstall(template)
        FileUtils.rm_r file_util.scaffold_directory(template)
      end

      desc "scaffold new NAME TEMPLATE_NAME", "Create a new scaffold by template."
      def new(name, template)
        @scaffold_name = name
        directory file_util.scaffold_directory(template), File.expand_path(name)
      end

      desc "scaffold wipe", "Delete all scaffold templates."
      def wipe
        file_util.scaffold_entries(true).each { |e| FileUtils.rm_r e }
      end

      desc "scaffold list [SEARCH]", "Lists scaffold templates."
      def list(search=nil)
        entries = file_util.scaffold_entries
        entries = entries.select { |e| e.include?(search) } unless search.nil?
        entries.each { |e| say "  #{e}" }
        say "No templates found.", :blue if entries.empty?
      end

      no_tasks {

        def scaffold_name
          @scaffold_name
        end

      }

      private

      def file_util
        @_file_util ||= Gator::Scaffolding::ScaffoldingFileUtils.new
      end

    end
  end
end