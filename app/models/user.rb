class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :cohort
  has_many :employments
  has_many :companies, through: :employments

  store_accessor :status

  # scope :filter, ->(chicken){
  #   joins(:genres).where('genres.name = ?', chicken) if chicken.present?
  # }
  scope :filter, ->(chicken){
    joins(:companies).where('companies.name = ?', chicken) if chicken.present?
  }
  scope :search, ->(fname){where('fname LIKE ?', "%#{fname.capitalize}%") if fname.present?}


end
