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
      distance.times do
      anchor.each do |x, y|
        dilation x, y
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
    
    def dilation(x, y)
      strel x + 1, y # down one
      strel x - 1, y # up one
      strel x, y + 1 # right one
      strel x, y - 1 # left one
      strel x - 1, y + 1 # right top diagonal
      strel x - 1, y - 1 # left top diagonal
      strel x + 1, y + 1 # right bottom diagonal
      strel x + 1, y - 1 # left bottom diagonal
    end
  
    def strel(x, y)
      return unless x >= 0 && x < @image[0].length - 1
      return unless y >= 0 && y < @image.length 
      @image[x][y] = 1 
    end
  end
  
  image = Image.new([
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ])
    
  image.blur!(2)
  image.output_image
