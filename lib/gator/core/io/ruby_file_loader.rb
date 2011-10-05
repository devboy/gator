class Gator
  class RubyFileLoader

  def initialize sandbox
    @sandbox = sandbox
  end

  def sandbox
    @sandbox
  end

  def exec_file file
		exec_code File.binread( file )
	end

	def exec_code code
		sandbox.module_eval( code )
  end

  end
end