# frozen_string_literal: true
class Admin < User
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
