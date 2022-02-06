# frozen_string_literal: true

class BaseCell < Cell::ViewModelSlim
  def call(state = :show, *args)
    ::Rails.logger.info("    Call ApplicationCell #{self.class.name}##{state} #{args}") if ::Rails.env.development?

    @action_name = state
    super
  end
end
