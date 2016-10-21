$:.unshift *Dir[File.expand_path("../lib/{,commands,ext}", __FILE__)]

# Extentions
require 'matrix_ext'

# Commands
require 'command_constants'
require 'command_exec'
require 'place_command'
require 'move_command'
require 'left_command'
require 'right_command'
require 'report_command'

# Core
require 'simulator'
require 'board_state'
