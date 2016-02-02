class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  belongs_to :cohort
  has_many :employments
  has_many :companies, through: :employments

  store_accessor :status, :seeking, :reason
  store_accessor :Social_links, :slack, :github, :linkedin, :portfolio

  scope :filter, ->(chicken){
    joins(:companies).where('companies.name = ?', chicken) if chicken.present?
  }
  scope :search, ->(fname){where('fname LIKE ?', "%#{fname.capitalize}%") if fname.present?}


end
