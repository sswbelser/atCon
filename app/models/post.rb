class Post < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_many :comments, dependent: :destroy
  
 has_attached_file :image,
                 :styles => { :medium => "150x150>", :thumb => "44x44#" },
                 :storage => :s3,
                 :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                 :path => "images /:id/:style/image.:extension",
                 :default_url => "https://s3.amazonaws.com/at-con/defaults/default_avatar.png"

   validates_attachment :image, 
                        :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                        :size => { :in => 0..1000.kilobytes }

    def s3_credentials
     { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
    end
end
