class Image
  def initialize(image)
    @image = image
  end

  def output_image
        @image.each do |row|
            puts row.join
      end
  end

 def blur!(distance)
  ones = anchor
  @image.each_with_index do |row, row_number|
    row.each_with_index do |item, col_number|
      ones.each do |found_row_number, found_col_number|
        if manhattan_distance(col_number, row_number, found_col_number, found_row_number) <= distance
          @image[row_number][col_number] = 1
        end
      end
    end
  end
end

  def anchor
    array = []
    @image.each.with_index do |row, x|
      row.each.with_index do |pixel, y|
        array << [x, y] if pixel == 1
      end
    end
    array
  end
  
   def manhattan_distance (x1, y1, x2, y2)
      horizontal_distance = (x2 - x1).abs
      vertical_distance = (y2 - y1).abs
      # (x2 - x1).abs + (y2 - y1).abs
      horizontal_distance + vertical_distance
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1]
])

image.blur!(2)
image.output_image
