require 'singleton'

class Simulator
  include Singleton

  attr_accessor :board

  def self.boot!
    instance.board ||= BoardState.new
    banner
    run
  end

  def self.board
    self.instance.board
  end

  def self.banner
    puts "Booting... ",
         "Please enter a command: ",
         "[P]LACE,[1-5],[1-5],[NESW]",
         "[R]EPORT | [r]eport",
         "[RI]GHT  | [ri]ght",
         "[L]EFT   | [l]eft",
         "[M]OVE   | [m]ove"
  end

  def self.run
    loop do
      input = STDIN.gets
      input.chomp!

      CommandExec.perform(input)
    end
  end
end
