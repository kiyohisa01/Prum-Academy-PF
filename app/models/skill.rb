class Skill < ApplicationRecord
    belongs_to :user #関連付け
    has_many :learnings, dependent: :destroy

    # self.data = [
    #     { id: 1, name: '9月' },
    #     { id: 2, name: '8月' },
    #     { id: 3, name: '7月' },
    #   ]
end
