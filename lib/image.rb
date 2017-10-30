class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def blur
   class Image 
  attr_accessor :image 
  def initialize(image)
    @image=image
  end
  
  def self.generate(height = 10,width = 10,density = 0.1) 
    new_image = Array.new(height){
      Array.new(width) {
        if rand < density 
          1
        else 
          0
        end         
      }
      
    }
    Image.new(new_image)
  end 
  
  def output_image
    self.image.each do |row|
      puts row.join " "
    end 
    nil 
  end
  
  def blur(distance = 1)
    temp_image = self
    distance.times do
      temp_image = temp_image.blur_once
    end 
    temp_image
  end
  
  
  def blur_once 
    new_image = Array.new(image.length){
      Array.new (image[0].length){0}
    }
    #loop start
    find_ones.each do |pair|
      row_index,col_index = pair
      if row_index != 0 
        new_image[row_index-1][col_index] = 1
      end
      if col_index != 0 
        new_image[row_index][col_index-1] = 1
      end
      if col_index != image[row_index].length - 1
        new_image[row_index][col_index+1] = 1
      end
      if row_index != image.length-1 
        new_image[row_index+1][col_index] = 1
      end
      new_image[row_index][col_index] = 1 
    end
    Image.new(new_image)
  end
  def find_ones
    ones = []
    @image.each_with_index do |row,row_index|
      row.each_with_index do |pixel,col_index|
        if pixel ==1
          ones.push [row_index, col_index] 
        end
      end
    end
    ones 
  end
end

image=Image.new ([
  [0,0,0,0,],
  [0,0,0,0,],
  [0,1,0,0,],
  [0,0,0,0,],
  [0,0,0,0,],
  [0,0,0,0,]
  
  ])
    return Image.new(@data)
  end
end