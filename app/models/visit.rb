class Visit < ActiveRecord::Base
  EVID_VALIDATION_REGEXP = /\A[A-z0-9]{8}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{12}\z/

  def evid=(str)
    super(EVID_VALIDATION_REGEXP.match(str))
  end
end
