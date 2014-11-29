class User < ActiveRecord::Base
  enum role: [:user, :instructor, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :unlock_codes

  def set_default_role
    self.role ||= :user
  end

  def formatted_name
    if !name.blank?
      return name
    elsif !first_name.blank?
      return "#{first_name} #{last_name}"
    else
      return email
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end


  protected

  def user_params
    params.require(:user).permit(:id, :email, :name, :first_name, :last_name, :role, :provider, :uid)
  end

end
