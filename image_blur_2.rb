class Image
    def initialize(image)
      @image = image
    end
  
    def output_image
          @image.each do |row|
              puts row.join
        end
    end
  
   def blur
      anchor.each do |x, y|
        dilation x, y
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
      strel x + 1, y
      strel x - 1, y
      strel x, y + 1
      strel x, y - 1
    end
  
    def strel(x, y)
      return unless x >= 0 && x < @image[0].length
      return unless y >= 0 && y < @image.length
      @image[x][y] = 1 
    end
  end
  
  image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
  ])
  
  image.blur
  image.output_image
  
  
=begin
  Image Blur 2 == A dilation algorithm
  
  Shape = binary image consisting of ones and zeros
    [ container for multidimensional (2d) array:
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
    ]
  
  structuring element = s
  [ ][1][ ]
  [1]{1}[1]
  [ ][1][ ]
  
  The {One} in the center of the structuring element == Anchor
  
  parameters 
  1. full match == 1
    if the anchor is in the center of the image then add a 1 following the design of the structuring element (strel)
  2. some match == 1
    if the anchor is on the edge of the image then add a 1 where available
  3. no match == 0
    else if the current pixel is a one then ignore operation
=end
  