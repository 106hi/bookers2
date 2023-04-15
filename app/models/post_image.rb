class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rsils.root.join('app/assets/images/no^image.jpg')
      image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type: 'image/jpeg')
    end
    image
  end
end
