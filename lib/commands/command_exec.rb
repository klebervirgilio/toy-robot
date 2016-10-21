module CommandExec
  extend self

  def perform(input)
    catch(:handled) do
      handle_place(input)
      next unless place_command_called?

      handle_move(input)
      handle_left(input)
      handle_right(input)
      handle_report(input)
    end
  rescue BoardState::OutOfBoundaryError
    p Simulator.board
  end

  def handle_place(input)
    return unless input =~ CommandConstants::PLACE_CMD_REGEXP

    place_command_called!
    throw :handled, PlaceCommand.call(x: $1, y: $2, facing: $3)
  end

  def handle_move(input)
    return unless input =~ CommandConstants::MOVE_CMD_REGEXP
    throw :handled, MoveCommand.call
  end

  def handle_report(input)
    return unless input =~ CommandConstants::REPORT_CMD_REGEXP
    throw :handled, ReportCommand.call
  end

  def handle_right(input)
    return unless input =~ CommandConstants::RIGHT_CMD_REGEXP
    throw :handled, RightCommand.call
  end

  def handle_left(input)
    return unless input =~ CommandConstants::LEFT_CMD_REGEXP
    throw :handled, LeftCommand.call
  end

  private
  def place_command_called!
    @@place_command_called = true
  end

  def place_command_called?
    defined? @@place_command_called
  end
end
