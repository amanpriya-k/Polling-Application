# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  answer_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  validates :answer_id, :user_id, presence: true
  validate :not_dup_response, on: :create

  
  def not_dup_response
    sibs = sibling_responses.pluck(:id, :user_id, :answer_id)
    if sibs.any? { |response| response[1] == self.user_id && response[0] != self.id } 
      errors[:user_id] << "Cannot respond to same question again"
      return false 
    end 
    true
  end
  
  def sibling_responses
    self.question.responses
  end

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice
    
  has_one :question,
    through: :answer_choice,
    source: :question
    
end
