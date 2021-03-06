# frozen_literal_string: true

FactoryBot.define do
  factory :observation do
    association :encounter
    association :person
    creator { User.last&.user_id || create(:user).user_id }
    obs_datetime { Time.now }

    factory :obs_appointment do
      concept do
        Concept.joins(:concept_names)\
               .where('concept_name.name = ?', 'Appointment Date')\
               .first
      end
      value_datetime { Time.now }
    end
  end
end
