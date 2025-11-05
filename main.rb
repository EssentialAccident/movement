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

    @game_object = GameObject.new(Vector2d.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2), 20)
  end

  def update
    @game_object.update
    @game_object.apply_force(Vector2d.new(0.1, 0)) if button_down?(Gosu::KB_RIGHT)
    @game_object.apply_force(Vector2d.new(-0.1, 0)) if button_down?(Gosu::KB_LEFT)
    @game_object.apply_force(Vector2d.new(0, 0.1)) if button_down?(Gosu::KB_DOWN)
    @game_object.apply_force(Vector2d.new(0, -0.1)) if button_down?(Gosu::KB_UP)
  end

  def draw
    @game_object.draw
  end

  def button_down(id)
    close if id == Gosu::KB_ESCAPE
  end
end

Main.new.show
