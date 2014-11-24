class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.admin!
    end
    user2 = User.find_or_create_by!(email: Rails.application.secrets.admin_2_email) do |user|
      user2.password = Rails.application.secrets.admin_2_password
      user2.password_confirmation = Rails.application.secrets.admin_2_password
      user2.admin!
    end
  end
end
