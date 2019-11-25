class MemberComment < ApplicationRecord
  belongs_to :member
  belongs_to :comment
end
