require 'fileutils'

class Gator
  module Scaffolding
    class ScaffoldingFileUtils
      include Thor::Actions

      def scaffolds_home
        File.join(Gator::Paths.gator_home, "scaffolds")
      end

      def scaffold_directory name
        File.join(scaffolds_home, name)
      end

      def directory_entries dir, join= true
        entries = Dir.entries dir
        entries.delete(".")
        entries.delete("..")
        entries.collect! { |e| File.join(dir, e) } if join
        entries
      end

      def last_directory_name dir
        dir.split(File::PATH_SEPARATOR).last
      end

      def scaffold_entries join= false
        directory_entries scaffolds_home, join
      end

      def create_empty_directory_files dir
        Dir.glob(File.join(dir, "**", "*")).each { |f|
          create_file File.join(f, ".empty_directory"), ".empty_directory" if File.directory?(f) && Dir.entries(f).length == 2
        }
      end

      def install_scaffold from_dir, name=nil
        name ||= last_directory_name from_dir
        entries = directory_entries from_dir
        install_dir = scaffold_directory(name)
        #empty_directory install_dir
        FileUtils.mkdir_p install_dir
        FileUtils.cp_r entries, install_dir
        create_empty_directory_files install_dir
      end

      def delete_scaffold name
        FileUtils.rm_r scaffold_directory(name)
      end

      def delete_all_scaffolds
        scaffold_entries.each { |scaffold| delete_scaffold(scaffold) }
      end

    end
  end
end
