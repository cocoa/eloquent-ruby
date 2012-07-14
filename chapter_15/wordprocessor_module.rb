module WordProcessor

  # modules can enclose individual methods

  def self.points_to_inches(points)
    points / 72
  end

  def self.inches_to_points(inches)
    inches * 72
  end

  # rest of the module omited...

end