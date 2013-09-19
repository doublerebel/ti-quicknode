{exec} = require 'child_process'

source = 'src/'
target = 'lib/'

task "build", "build from #{source} to #{target}", (options) ->
  exec "coffee --compile --map --output #{target} #{source}"
