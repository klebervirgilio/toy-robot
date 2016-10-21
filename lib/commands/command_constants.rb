module CommandConstants

  # Regexp to match MOVE command pattern
  MOVE_CMD_REGEXP = /\AM(?:OVE)?\z/i

  # Regexp to match REPORT command pattern
  REPORT_CMD_REGEXP = /\AR(?:EPORT)?\z/i

  # Regexp to match RIGHT command pattern
  RIGHT_CMD_REGEXP = /\ARI(?:GHT)?\z/i

  # Regexp to match LEFT command pattern
  LEFT_CMD_REGEXP = /\AL(?:EFT)?\z/i

  # Regexp to match the PLACE command pattern e.g: P,1,1,N
  PLACE_CMD_REGEXP = /\A
                      P(?:LACE)?,  # P or PLACE
                      ([1-5]),  # X axis
                      ([1-5]),  # Y axis
                      ([NESW]) # Cardinal Points
                    \z/xi
end
