# frozen_string_literal: true

# Base class for all Game Objects
class GameObject
  def initialize(position, size)
    @position = position
    @velocity = Vector2d.new(0, 0)
    @acceleration = Vector2d.new(0, 0)

    @size = size
  end

  def update
    @velocity += @acceleration
    @position += @velocity
  end

  def draw
    # The game object will be represented by a isosceles triangle.
    # The vertex of that triangle where the two equal sides meet will point in
    # the direction of movement.
    Gosu.draw_triangle(@position.x + (@size / 2), @position.y, Gosu::Color::WHITE,
                       @position.x - (@size / 2), @position.y - @size / 2, Gosu::Color::WHITE,
                       @position.x - (@size / 2), @position.y + @size / 2, Gosu::Color::WHITE)
  end
end
