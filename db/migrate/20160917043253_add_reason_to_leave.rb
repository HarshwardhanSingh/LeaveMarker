class AddReasonToLeave < ActiveRecord::Migration[5.0]
  def change
    add_reference :leaves, :reason, foreign_key: true
  end
end
