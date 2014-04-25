class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if resource.persisted?
      Analytics.identify(
        user_id: current_user.id,
        traits: { email: current_user.email, zipcode: current_user.zipcode })
    end
  end
end


