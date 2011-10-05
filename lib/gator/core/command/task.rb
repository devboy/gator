class Gator
  class Task < Thor::Group
    include ActAsCommand
    include Thor::Actions
  end
end