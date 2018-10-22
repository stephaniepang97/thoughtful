class SessionQuestion < ApplicationRecord

  # Relationships
  belongs_to :patient_session
  belongs_to :question

  # Validations
  validates_presence_of :patient_session_id, :question_id
end
