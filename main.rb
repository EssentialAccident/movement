# frozen_string_literal: true

# Gems
require 'gosu'
require 'gosu_more_drawables'
require 'vector2d'

# Internal files
require_relative 'libraries/game_object'

# Global Constants
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800

# Class to control the game loop
class Main < Gosu::Window
  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = 'Whatever'

    @game_object = GameObject.new(Vector2d.new(100, 100), 20)
  end

  def update
  end

  def draw
    @game_object.draw
  end

  def button_down(id)
    close if id == Gosu::KB_ESCAPE
  end
end

Main.new.show
