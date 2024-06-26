class User < ApplicationRecord
  validates :email, email: true, allow_nil: true

  with_options if: :john? do
    validates :email, presence: true
  end

  def john?
    name&.match?(/john/i) || false
  end
end
