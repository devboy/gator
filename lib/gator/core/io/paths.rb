class Gator
  class Paths

      def self.gator_home
        File.join( Thor::Util.user_home, ".gator" ).gsub(/\\/, '/')
      end

  end
end