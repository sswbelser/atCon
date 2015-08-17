class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_secure_password
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :conferences
  validates :email, presence: true, 
                    length: {minimum: 2},
                    uniqueness: true,
                    format: {with: /@/, message: "not valid email, try again loser"}
  validates :password, presence: true,
                      length: {minimum: 6}

 has_attached_file :avatar,
                 :styles => { :medium => "150x150>", :thumb => "44x44#" },
                 :storage => :s3,
                 :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                 :path => "avatars/:id/:style/avatar.:extension",
                 :default_url => "https://s3.amazonaws.com/at-con/defaults/default_avatar.png"

 validates_attachment :avatar, :presence => true,
                      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                      :size => { :in => 0..100.kilobytes }
  def s3_credentials
   { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end
                       
end



