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

    @acceleration *= 0

    @position = Vector2d.new(@position.x % WINDOW_WIDTH, @position.y % WINDOW_HEIGHT)
  end

  def draw
    # The game object will be represented by a isosceles triangle.
    # The vertex of that triangle where the two equal sides meet will point in
    # the direction of movement.
    half = @size / 2
    pts = [
      Vector2d.new(half, 0),
      Vector2d.new(-half, - half),
      Vector2d.new(-half,  half)
    ]

    # Finding the angle of the Velocity vector and calculating
    # the sin and cos
    angle = @velocity.angle
    cos_angle = Math.cos(angle)
    sin_angle = Math.sin(angle)

    world = pts.map do |pt|
      x = pt.x * cos_angle - pt.y * sin_angle + @position.x
      y = pt.x * sin_angle + pt.y * cos_angle + @position.y
      Vector2d.new(x, y)
    end

    # Drawing the triangle according to the angle of movement
    Gosu.draw_triangle(
      world[0].x, world[0].y, Gosu::Color::WHITE,
      world[1].x, world[1].y, Gosu::Color::WHITE,
      world[2].x, world[2].y, Gosu::Color::WHITE
    )
  end

  def apply_force(force)
    @acceleration += force
  end
end
